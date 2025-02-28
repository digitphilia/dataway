/********************************************************************
Global Harmonized System (HS) Codes Schema & Tables

Harmonized System (HS) Codes are a common standard for classification
of products, services and trade transactions. The Harmonized System
(HS) is a system of classification of trade items according to their
nature and use. The following tabels are created to capture the
harmonized system codes - their nature and relationship.

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
        VARCHAR(256)
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
        VARCHAR(256)
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
        VARCHAR(256)
        CONSTRAINT uq_hs_heading_desc UNIQUE,

    -- ? heading is a 4 digit code, but the number of available codes are
    -- large, thus a created on field is added into the meta table to track
    -- the insertion (i.e., created on) date for a hs heading code, same for hs code
    created_on
        DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP
);


CREATE TABLE IF NOT EXISTS public.mw_hs_code (
    hs_code
        CHAR(8)
        CONSTRAINT pk_hs_code PRIMARY KEY,

    hs_heading_code
        CHAR(4) NOT NULL
        CONSTRAINT fk_hs_heading_code
            REFERENCES public.mw_hs_heading_code(hs_heading_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    hsc_description
        VARCHAR(256)
        CONSTRAINT uq_hsc_description UNIQUE
);
