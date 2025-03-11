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

Author  : Debmalya Pramanik
Contact : email@example.com
Version : v1.0.0

Copywright © [2025] Debmalya Pramanik, DigitPhilia INC
********************************************************************/

CREATE TABLE IF NOT EXISTS public.mw_hs_section_code (
    hs_section_code
        CHAR(2)
        CONSTRAINT pk_hs_code PRIMARY KEY,

    hs_section_desc
        VARCHAR(256) NOT NULL
        CONSTRAINT uq_hs_section_desc UNIQUE
);


CREATE TABLE IF NOT EXISTS public.mw_hs_chapter_code (
    hs_chapter_code
        CHAR(2)
        CONSTRAINT pk_hs_chapter_code PRIMARY KEY,

    hs_section_code
        CHAR(2) NOT NULL
        CONSTRAINT fk_hs_section_code
            REFERENCES public.mw_hs_section_code(hs_section_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    hs_chapter_desc
        VARCHAR(256) NOT NULL
        CONSTRAINT uq_hs_chapter_desc UNIQUE
);


CREATE TABLE IF NOT EXISTS public.mw_hs_heading_code (
    hs_heading_code
        CHAR(4)
        CONSTRAINT pk_hs_heading_code PRIMARY KEY,

    hs_chapter_code
        CHAR(2) NOT NULL
        CONSTRAINT fk_hs_chapter_code
            REFERENCES public.mw_hs_chapter_code(hs_chapter_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    hs_heading_desc
        VARCHAR(256) NOT NULL
        CONSTRAINT uq_hs_heading_desc UNIQUE,

    created_on
        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS public.mw_hs_subheading_code (
    hs_subheading_code
        CHAR(6)
        CONSTRAINT pk_hs_subheading_code PRIMARY KEY,

    hs_heading_code
        CHAR(4) NOT NULL
        CONSTRAINT fk_hs_heading_code
            REFERENCES public.mw_hs_heading_code(hs_heading_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    hs_subheading_desc
        VARCHAR(256) NOT NULL
        CONSTRAINT uq_hs_subheading_desc UNIQUE,

    created_on
        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS public.mw_hs_code (
    hs_code
        CHAR(8)
        CONSTRAINT pk_hs_code PRIMARY KEY,

    hs_subheading_code
        CHAR(6) NOT NULL
        CONSTRAINT fk_hs_subheading_code
            REFERENCES public.mw_hs_subheading_code(hs_subheading_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    hs_code_desc
        VARCHAR(256) NOT NULL
        CONSTRAINT uq_hsc_description UNIQUE,

    created_on
        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);
