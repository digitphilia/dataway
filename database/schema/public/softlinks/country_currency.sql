/********************************************************************
Soft Link between [PUBLIC].[COUNTRY] & [PUBLIC].[CURRENCY]

The softlink establishes relationship between the two schema
`public.country` and `public.currency`by creating a table of foreign
key to map tables.

Table Code Name: `cc` - Country Currency Abbreviation

SL Objective: Create a relationship to list the currency used in a
country. We may want to add a feature to track primary/secondary/other
types of currency using this table to.

We've also added a dated activity field which can be used to track the
active currency and past currency of the entity.

Copywright © [2025] Debmalya Pramanik, DigitPhilia INC.
********************************************************************/

CREATE TABLE IF NOT EXISTS public.sl_country_currency (
    _id
        SERIAL PRIMARY KEY,

    country_code
        CHAR(3) NOT NULL
        CONSTRAINT fk_sl_cc_country_code
            REFERENCES public.mw_country(country_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    currency_code
        CHAR(3) NOT NULL
        CONSTRAINT fk_sl_cc_currency_code
            REFERENCES public.mw_currency(currency_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    is_active
        BOOLEAN NOT NULL DEFAULT TRUE,

    inactive_reason
        VARCHAR(256),

    created_on
        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_on
        TIMESTAMP,

    CONSTRAINT uq_sl_country_currency
        UNIQUE (country_code, currency_code),

    CONSTRAINT ck_ammendment_reason CHECK (
        (is_active IS TRUE AND inactive_reason IS NULL)
        OR (is_active IS FALSE AND inactive_reason IS NOT NULL)
    )
);
