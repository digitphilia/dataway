/********************************************************************
The Foreign Exchange Rates (FOREX) Tracking Table

The table is designed to store the exchange rates of different
currencies and is a private table. We may not want to disclose the
data source to an external vendor so this table is not directly
exposed to the enduser. However, we will have a hardlink to the data
source using a proxy table thus maintaining privacy and control. A
seperate hard link to the currency code master is also maintained and
the below defined transaction table is always dependent with the
currency schema table(s).

Copywright © [Copywright Year] Debmalya Pramanik, DigitPhilia INC.
********************************************************************/

CREATE TABLE IF NOT EXISTS private.tx_forex_rate (
    _id
        SERIAL PRIMARY KEY,

    effective_date
        DATE NOT NULL,

    base_currency_code
        CHAR(3) NOT NULL
        CONSTRAINT fk_base_currency_code
            REFERENCES public.mw_currency(currency_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    target_currency_code
        CHAR(3) NOT NULL
        CONSTRAINT fk_target_currency_code
            REFERENCES public.mw_currency(currency_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    exchange_rate
        NUMERIC(19, 6) NOT NULL,

    created_on
        TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,

    updated_on
        TIMESTAMP,

    data_source_proxy_id
        SMALLINT NOT NULL
        CONSTRAINT fk_forex_data_source_proxy_id
            REFERENCES internals.mw_data_source_proxy(data_source_proxy_id)
            ON UPDATE CASCADE
            ON DELETE SET NULL
);
