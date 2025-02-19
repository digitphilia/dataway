CREATE TABLE [meta].[mw_country] (
    [country_code] CHAR(3),
    [country_name] VARCHAR(64) NOT NULL,

    [iso2_code]     CHAR(2) NOT NULL,
    [currency_code] CHAR(3),

    CONSTRAINT [pk_country_code] PRIMARY KEY NONCLUSTERED ([country_code]),
    CONSTRAINT [uq_country_name] UNIQUE ([country_name]),
    CONSTRAINT [uq_country_iso2] UNIQUE ([iso2_code]),

    CONSTRAINT [fk_country_currency] FOREIGN KEY ([currency_code])
        REFERENCES [meta].[currency_code] ([currency_code])
        ON DELETE SET NULL
        ON UPDATE CASCADE
);
