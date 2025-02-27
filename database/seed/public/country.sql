/********************************************************************
Initial Seed Data for Public Schema: Country Database

The initial seed data is as per schema design for the country related
tables (.../schema/public/country.sql). The continent, region and the
subregion code are generated based on personal preference and may or
maynot be consistent with standard naming conventions.

Copywright © [2025] Debmalya Pramanik, DigitPhilia INC.
********************************************************************/

INSERT INTO public.mw_continent (continent_code, continent_name, wikidata_id) VALUES
    ('AS', 'ASIA', 'Q48'),
    ('AF', 'AFRICA', 'Q15'),
    ('EU', 'EUROPE', 'Q46'),
    ('NA', 'NORTH AMERICA', 'Q49'),
    ('SA', 'SOUTH AMERICA', 'Q18'),
    ('AU', 'AUSTRALIA', 'Q3960'),
    ('AN', 'ANTARTICA', 'Q51');


INSERT INTO public.mw_region (region_code, region_name, wikidata_id) VALUES
    ('ASA', 'ASIA', 'Q48'),
    ('POL', 'POLAR', 'Q51'),
    ('AFR', 'AFRICA', 'Q15'),
    ('EUR', 'EUROPE', 'Q46'),
    ('AMN', 'AMERICAS', 'Q828'),
    ('OCN', 'OCEANIA', 'Q55643');


INSERT INTO public.mw_subregion (subregion_code, subregion_name, region_code, wikidata_id) VALUES
    ('ANZ', 'Australia & New Zealand', 'OCN', 'Q45256'),
    ('CAB', 'Carribean Islands', 'AMN', 'Q664609'),
    ('CAM', 'Central America', 'AMN', 'Q27611'),
    ('CAS', 'Central Asia', 'ASA', 'Q27275'),
    ('EAF', 'Eastern Africa', 'AFR', 'Q27407'),
    ('EAS', 'Eastern Asia', 'ASA', 'Q27231'),
    ('EEU', 'Eastern Europe', 'EUR', 'Q27468'),
    ('MEL', 'Melanesia Region', 'OCN', 'Q37394'),
    ('MIC', 'Micronesia Region', 'OCN', 'Q3359409'),
    ('MAF', 'Middle Africa', 'AFR', 'Q27433'),
    ('NAF', 'Northern Africa', 'AFR', 'Q27381'),
    ('NAM', 'Northern America', 'AMN', 'Q2017699'),
    ('NEU', 'Northern Europe', 'EUR', 'Q27479'),
    ('POL', 'Polynesia Region', 'OCN', 'Q35942'),
    ('SAM', 'South America', 'AMN', 'Q18'),
    ('SEA', 'South-Eastern Asia', 'ASA', 'Q11708'),
    ('SAF', 'Southern Africa', 'AFR', 'Q27394'),
    ('SAS', 'Southern Asia', 'ASA', 'Q771405'),
    ('SEU', 'Southern Europe', 'EUR', 'Q27449'),
    ('WAF', 'Western Africa', 'AFR', 'Q4412'),
    ('WAS', 'Western Asia', 'ASA', 'Q27293'),
    ('WEU', 'Western Europe', 'EUR', 'Q27496');
