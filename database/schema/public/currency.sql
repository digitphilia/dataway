/********************************************************************
World Currency & Derivatives Details

The following tables contains information like the currency name,
symbol, code and minor units among typical things to be used for a
set of analysis or as a proxy for economic factors for various analysis.

Author  : Debmalya Pramanik
Contact : email@example.com
Version : v1.0.0

Copywright © [2025] Debmalya Pramanik, DigitPhilia INC
********************************************************************/

CREATE TABLE IF NOT EXISTS public.mw_currency_type (
    currency_type
        CHAR(1)
        CONSTRAINT pk_currency_type PRIMARY KEY,

    currency_type_name
        VARCHAR(32) NOT NULL
        CONSTRAINT uq_currency_type_name UNIQUE,

    currency_type_desc
        VARCHAR(128) NOT NULL,

    wikidata_id
        VARCHAR(8) NOT NULL
        CONSTRAINT uq_currency_type_wikidata_id UNIQUE
);


CREATE TABLE IF NOT EXISTS public.mw_currency_subtype (
    currency_subtype
        CHAR(1)
        CONSTRAINT pk_currency_subtype PRIMARY KEY,

    currency_subtype_name
        VARCHAR(48) NOT NULL
        CONSTRAINT uq_currency_subtype_name UNIQUE,

    currency_type
        CHAR(1) NOT NULL
        CONSTRAINT fk_currency_subtype_currency_type
            REFERENCES public.mw_currency_type(currency_type)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    currency_subtype_desc
        VARCHAR(128) NOT NULL,

    wikidata_id
        VARCHAR(8) NOT NULL
        CONSTRAINT uq_currency_subtype_wikidata_id UNIQUE
);


CREATE TABLE IF NOT EXISTS public.mw_currency (
    currency_code
        CHAR(3)
        CONSTRAINT pk_currency_code PRIMARY KEY,

    currency_name
        VARCHAR(64) NOT NULL
        CONSTRAINT uq_currency_name UNIQUE,

    currency_symbol
        VARCHAR(16) NOT NULL
        CONSTRAINT uq_currency_symbol UNIQUE,

    currency_type
        CHAR(1) NOT NULL
        CONSTRAINT fk_currency_currency_type
            REFERENCES public.mw_currency_type(currency_type)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    currency_subtype
        CHAR(1)
        CONSTRAINT fk_currency_currency_subtype
            REFERENCES public.mw_currency_subtype(currency_subtype)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    n_decimals
        INTEGER NOT NULL DEFAULT 2,

    minor_unit_name
        VARCHAR(32),

    minor_unit_symbol
        VARCHAR(16),

    minor_unit_factor
        INTEGER,

    CONSTRAINT ck_minor_currency_null CHECK (
        NUM_NULLS(minor_unit_name, minor_unit_symbol, minor_unit_factor) IN (0, 3)
    )
);
