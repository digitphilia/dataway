/********************************************************************
Global Harmonized System (HS) Codes Schema & Tables

Harmonized System (HS) Codes are a common standard for classification
of products, services and trade transactions. The Harmonized System
(HS) is a system of classification of trade items according to their
nature and use. The following tabels are created to capture the
harmonized system codes - their nature and relationship.

Since there are multiple heading and subheading code in a chapter and
also the HS code varies from country to country we have added an
timestamp filed to track the date of creation of the record.

Copywright © [2025] Debmalya Pramanik, DigitPhilia INC.
********************************************************************/

CREATE TABLE IF NOT EXISTS public.mw_hs_major_revision (
    hs_major_revision_date
        DATE
        CONSTRAINT pk_revision_date PRIMARY KEY,
        
    hs_major_revision_comment
        VARCHAR(256) NOT NULL,

    is_active
          BOOLEAN NOT NULL DEFAULT FALSE
);


CREATE TABLE IF NOT EXISTS public.mw_hs_minor_revision (
    minor_revision_date
        DATE
        CONSTRAINT pk_minor_revision_date PRIMARY KEY,

    minor_revision_remarks
        VARCHAR(256),
    
    created_on
        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_on
        TIMESTAMP
);


CREATE TABLE IF NOT EXISTS public.mw_hs_section_code (
    hs_section_id
        CHAR(7)
        CONSTRAINT pk_hs_section_id PRIMARY KEY,

    hs_section_code
        CHAR(2) NOT NULL,

    hs_section_desc
        VARCHAR(256) NOT NULL,

    major_revision_date
        DATE NOT NULL
        CONSTRAINT fk_major_revision_date_section
            REFERENCES public.mw_hs_major_revision(hs_major_revision_date)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    CONSTRAINT uq_hs_section_code UNIQUE(major_revision_date, hs_section_code),
    CONSTRAINT uq_hs_section_desc UNIQUE(major_revision_date, hs_section_code, hs_section_desc)
);


CREATE TABLE IF NOT EXISTS public.mw_hs_chapter_code (
    hs_chapter_id
        CHAR(7)
        CONSTRAINT pk_hs_chapter_id PRIMARY KEY,

    hs_chapter_code
        CHAR(2) NOT NULL,

    hs_section_id
        CHAR(7) NOT NULL
        CONSTRAINT fk_hs_section_id
            REFERENCES public.mw_hs_section_code(hs_section_id)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    hs_chapter_desc
        VARCHAR(256) NOT NULL,

    CONSTRAINT uq_hs_chapter_code UNIQUE(hs_section_id, hs_chapter_code),
    CONSTRAINT uq_hs_chapter_desc UNIQUE(hs_section_id, hs_chapter_code, hs_chapter_desc)
);


CREATE TABLE IF NOT EXISTS public.mw_hs_heading_code (
    hs_heading_id
        CHAR(9)
        CONSTRAINT pk_hs_heading_id PRIMARY KEY,

    hs_heading_code
        CHAR(4) NOT NULL,

    hs_chapter_id
        CHAR(7) NOT NULL
        CONSTRAINT fk_hs_chapter_id
            REFERENCES public.mw_hs_chapter_code(hs_chapter_id)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    hs_heading_desc
        VARCHAR(256) NOT NULL,

    CONSTRAINT uq_hs_heading_code UNIQUE(hs_heading_id, hs_heading_code),
    CONSTRAINT uq_hs_heading_desc UNIQUE(hs_heading_id, hs_heading_code, hs_heading_desc)
);


CREATE TABLE IF NOT EXISTS public.mw_hs_subheading_code (
    hs_subheading_uuid
        CHAR(36)
        CONSTRAINT pk_hs_subheading_uuid PRIMARY KEY,

    hs_subheading_code
        CHAR(6),

    hs_heading_uuid
        CHAR(36) NOT NULL
        CONSTRAINT fk_hs_heading_uuid
            REFERENCES public.mw_hs_heading_code(hs_heading_uuid)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    hs_subheading_desc
        VARCHAR(256) NOT NULL,

    CONSTRAINT uq_hs_subheading_code UNIQUE(hs_heading_uuid, hs_subheading_code),
    CONSTRAINT uq_hs_subheading_desc UNIQUE(hs_heading_uuid, hs_subheading_code, hs_subheading_desc)
);


CREATE TABLE IF NOT EXISTS public.mw_hs_code (
    hs_code_uuid
        CHAR(36)
        CONSTRAINT pk_hs_code_uuid PRIMARY KEY,

    hs_code
        VARCHAR(12),

    hs_subheading_uuid
        CHAR(6) NOT NULL
        CONSTRAINT fk_hs_subheading_uuid
            REFERENCES public.mw_hs_subheading_code(hs_subheading_uuid)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    hs_code_desc
        VARCHAR(256) NOT NULL,

    minor_revision_date
        DATE NOT NULL
        CONSTRAINT fk_minor_revision_date_hs_code
            REFERENCES public.mw_hs_minor_revision(minor_revision_date)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    CONSTRAINT uq_hs_code UNIQUE(hs_subheading_uuid, minor_revision_date, hs_code),
    CONSTRAINT uq_hs_desc UNIQUE(hs_subheading_uuid, minor_revision_date, hs_code, hs_code_desc)
);
