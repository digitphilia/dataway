/********************************************************************
Global World Country States Cities Table Details

The following table contains the list of continents, regions, country,
states and cities details which can be used for various functionality
and may also serve as indexation for transactional data.

CHANGELOG: All major changes related to this file is documented here,
(recommended to be used in a standalone query file) and follows the
sementic versioning (https://semver.org/).
    * v1.0.0: The initial production release. The following features
      and details are available:
        - added master table for continents,
        - added master table for regions and subregions,
        - added master table for countries, mapping with regions,
            subregions and continent name, and
        - each data point has an Wiki Data ID which can be used to
            fetch and view additional details.

Author  : Debmalya Pramanik
Contact : email@example.com
Version : v1.0.0

Copywright © [2025] Debmalya Pramanik, DigitPhilia INC
********************************************************************/

CREATE TABLE IF NOT EXISTS public.mw_continent (
    continent_code
        CHAR(2)
        CONSTRAINT pk_continent_code PRIMARY KEY,

    continent_name
        VARCHAR(64)
        CONSTRAINT uq_continent_name UNIQUE,
    
    wikidata_id
        VARCHAR(16)
        CONSTRAINT uq_continent_wikidata_id UNIQUE
);


CREATE TABLE IF NOT EXISTS public.mw_region (
    region_code
        CHAR(3)
        CONSTRAINT pk_region_code PRIMARY KEY,

    region_name
        VARCHAR(64)
        CONSTRAINT uq_region_name UNIQUE,

    continent_code
        CHAR(2)
        CONSTRAINT fk_region_continent_code
            REFERENCES public.mw_continent(continent_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,
    
    wikidata_id
        VARCHAR(16)
        CONSTRAINT uq_region_wikidata_id UNIQUE
);


CREATE TABLE IF NOT EXISTS public.mw_subregion (
    subregion_code
        CHAR(3)
        CONSTRAINT pk_subregion_code PRIMARY KEY,

    subregion_name
        VARCHAR(64)
        CONSTRAINT uq_subregion_name UNIQUE,

    continent_code
        CHAR(2)
        CONSTRAINT fk_subregion_continent_code
            REFERENCES public.mw_continent(continent_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    region_code
        CHAR(3)
        CONSTRAINT fk_subregion_region_code
            REFERENCES public.mw_region(region_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,
    
    wikidata_id
        VARCHAR(16)
        CONSTRAINT uq_subregion_wikidata_id UNIQUE
);


CREATE TABLE IF NOT EXISTS public.mw_country (
    country_code
        CHAR(3)
        CONSTRAINT pk_country_code PRIMARY KEY,

    country_name
        VARCHAR(64)
        CONSTRAINT uq_country_name UNIQUE,

    continent_code
        CHAR(2)
        CONSTRAINT fk_country_continent_code
            REFERENCES public.mw_continent(continent_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,
    
    region_code
        CHAR(3)
        CONSTRAINT fk_country_region_code
            REFERENCES public.mw_region(region_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    subregion_code
        CHAR(3)
        CONSTRAINT fk_country_subregion_code
            REFERENCES public.mw_subregion(subregion_code)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    iso2_code
        CHAR(2)
        CONSTRAINT uq_country_iso2 UNIQUE,
    
    numeric_code
        CHAR(3)
        CONSTRAINT uq_country_numeric_code UNIQUE,
    
    top_level_domain
        CHAR(3)
        CONSTRAINT uq_country_top_level_domain UNIQUE
);
