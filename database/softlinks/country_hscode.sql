/********************************************************************
Soft Link between [PUBLIC].[COUNTRY] & [PUBLIC].[HSCODE]

The softlink establishes relationship between the two schema
`public.country` and `public.hscode`by creating a table of foreign
key to map tables.

Table Code Name: `cc` - Country Currency Abbreviation

SL Objective: Create a relationship between the list of traded HSN
codes which are being tracked in the trade transaction.

Copywright © [2025] Debmalya Pramanik, DigitPhilia INC.
********************************************************************/

CREATE TABLE IF NOT EXISTS public.sl_country_hscode (
    _id
        SERIAL PRIMARY KEY,

    country_code
        CHAR(3) NOT NULL
        CONSTRAINT fk_sl_cc_country_code
            REFERENCES public.mw_country(country_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    hs_code_id
        VARCHAR(21) NOT NULL
        CONSTRAINT fk_sl_cc_hs_code_id
            REFERENCES public.mw_hs_code(hs_code_id)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    created_on
        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_on
        TIMESTAMP,

    CONSTRAINT uq_sl_country_hscode
        UNIQUE (country_code, hs_code_id)
);
