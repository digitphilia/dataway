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
        - 

Author  : Debmalya Pramanik
Contact : email@example.com
Version : v1.0.0

Copywright © [2025] Debmalya Pramanik, DigitPhilia INC
********************************************************************/

CREATE TABLE IF NOT EXISTS public.mw_country (
    country_code
        CHAR(3)
        CONSTRAINT pk_country_code PRIMARY KEY,

    country_name
        VARCHAR(64)
        CONSTRAINT uq_country_name UNIQUE,

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
