/********************************************************************
Global World Country States Cities Table Details

The following table contains the list of continents, regions, country,
states and cities details which can be used for various functionality
and may also serve as indexation for transactional data.

Author  : Debmalya Pramanik
Contact : email@example.com
Version : v1.0.1

Copywright © [2025] Debmalya Pramanik, DigitPhilia INC
********************************************************************/

CREATE TABLE IF NOT EXISTS public.mw_continent (
    continent_code
        CHAR(2)
        CONSTRAINT pk_continent_code PRIMARY KEY,

    continent_name
        VARCHAR(64) NOT NULL
        CONSTRAINT uq_continent_name UNIQUE,

    wikidata_id
        VARCHAR(8) NOT NULL
        CONSTRAINT uq_continent_wikidata_id UNIQUE
);


CREATE TABLE IF NOT EXISTS public.mw_region (
    region_code
        CHAR(3)
        CONSTRAINT pk_region_code PRIMARY KEY,

    region_name
        VARCHAR(64) NOT NULL
        CONSTRAINT uq_region_name UNIQUE,

    wikidata_id
        VARCHAR(8) NOT NULL
        CONSTRAINT uq_region_wikidata_id UNIQUE
);


CREATE TABLE IF NOT EXISTS public.mw_subregion (
    subregion_code
        CHAR(3)
        CONSTRAINT pk_subregion_code PRIMARY KEY,

    subregion_name
        VARCHAR(64) NOT NULL
        CONSTRAINT uq_subregion_name UNIQUE,

    continent_code
        CHAR(2) NOT NULL
        CONSTRAINT fk_subregion_continent_code
            REFERENCES public.mw_continent(continent_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    region_code
        CHAR(3) NOT NULL
        CONSTRAINT fk_subregion_region_code
            REFERENCES public.mw_region(region_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    wikidata_id
        VARCHAR(8) NOT NULL
        CONSTRAINT uq_subregion_wikidata_id UNIQUE
);


CREATE TABLE IF NOT EXISTS public.mw_country (
    country_code
        CHAR(3)
        CONSTRAINT pk_country_code PRIMARY KEY,

    country_name
        VARCHAR(64) NOT NULL
        CONSTRAINT uq_country_name UNIQUE,

    continent_code
        CHAR(2) NOT NULL
        CONSTRAINT fk_country_continent_code
            REFERENCES public.mw_continent(continent_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    region_code
        CHAR(3) NOT NULL
        CONSTRAINT fk_country_region_code
            REFERENCES public.mw_region(region_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    subregion_code
        CHAR(3) NOT NULL
        CONSTRAINT fk_country_subregion_code
            REFERENCES public.mw_subregion(subregion_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    iso2_code
        CHAR(2) NOT NULL
        CONSTRAINT uq_country_iso2 UNIQUE,

    numeric_code
        CHAR(3) NOT NULL
        CONSTRAINT uq_country_numeric_code UNIQUE,

    top_level_domain
        CHAR(3)
        CONSTRAINT uq_country_top_level_domain UNIQUE,

    wikidata_id
        VARCHAR(8)
        CONSTRAINT uq_country_wikidata_id UNIQUE,

    country_flag_uri
        VARCHAR(256)
        CONSTRAINT uq_country_flag_uri UNIQUE
);


CREATE TABLE IF NOT EXISTS public.mw_state (
    state_code
        CHAR(5)
        CONSTRAINT pk_state_code PRIMARY KEY,

    state_name
        VARCHAR(64) NOT NULL,

    country_code
        CHAR(3) NOT NULL
        CONSTRAINT fk_state_country_code
            REFERENCES public.mw_country(country_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    state_type
        VARCHAR(32),

    state_latitude
        NUMERIC(9, 6),

    state_longitude
        NUMERIC(9, 6),

    CONSTRAINT uq_state_name UNIQUE (country_code, state_name)
);


CREATE TABLE IF NOT EXISTS public.mw_city (
    city_code
        SERIAL
        CONSTRAINT pk_city_code PRIMARY KEY,

    city_name
        VARCHAR(64) NOT NULL,

    country_code
        CHAR(3) NOT NULL
        CONSTRAINT fk_city_country_code
            REFERENCES public.mw_country(country_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    state_code
        CHAR(5) NOT NULL
        CONSTRAINT fk_city_state_code
            REFERENCES public.mw_state(state_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    city_type
        VARCHAR(32),

    city_latitude
        NUMERIC(9, 6),

    city_longitude
        NUMERIC(9, 6),

    CONSTRAINT uq_city_name UNIQUE (country_code, state_code, city_name)
);
