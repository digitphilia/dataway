/********************************************************************
Master Initialization file for SQL Code Coverage Check

The GitHub Action SQL Code Check is defined to check the integrity of
the SQL statements defined in the directory. Any new script should be
added to the initialization file in the correct way to be checked.

Copywright © [2025] Debmalya Pramanik, DigitPhilia INC.
********************************************************************/

\i database/schema/public/country.sql
\i database/schema/public/currency.sql

-- ? we can now create the softlinks table between country and currency
\i database/softlinks/country_currency.sql
