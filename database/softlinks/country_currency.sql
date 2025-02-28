/********************************************************************
Soft Link between [PUBLIC].[COUNTRY] & [PUBLIC].[CURRENCY]

The softlink establishes relationship between the two schema
`public.country` and `public.currency`by creating a table of foreign
key to map tables.

Table Code Name: `cc` - Country Currency Abbreviation

SL Objective: Create a relationship to list the currency used in a
country. We may want to add a feature to track primary/secondary/other
types of currency using this table to.

Copywright © [2025] Debmalya Pramanik
********************************************************************/

CREATE TABLE IF NOT EXISTS public.sl_country_currency (
    _id
        SERIAL PRIMARY KEY,

    country_code
        CHAR(2) NOT NULL
        CONSTRAINT fk_sl_cc_country_code
            REFERENCES public.country(country_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    currency_code
        CHAR(3) NOT NULL
        CONSTRAINT fk_sl_cc_currency_code
            REFERENCES public.currency(currency_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    CONSTRAINT uq_sl_country_currency
        UNIQUE (country_code, currency_code)
);
