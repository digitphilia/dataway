/********************************************************************
A Proxy Table for Data Source Tracking

We may not want to expose the internal data sources to an external
client/vendor to mitigate this issue we will use a proxy table which
is a table of random primary keys and the same is referenced in the
data source schema. The proxy table is always independent at the
client machine however in the internal data source schema is calls the
table with an underlying hard link constraint.

Copywright © [2025] Debmalya Pramanik, DigitPhilia INC.
********************************************************************/

CREATE TABLE IF NOT EXISTS internals.data_source_proxy (
    data_source_proxy_id
        SMALLSERIAL pk_data_source_proxy_id PRIMARY KEY,

    data_source_proxy_desc
        VARCHAR(256) NOT NULL
);
