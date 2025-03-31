/********************************************************************
Initial Seed Data for Public Schema: Currency Database

The initial seed data is as per schema design for the currency related
information like types, subtypes, names, smaller units, etc. to be
tracked for various purposes.

Copywright © [2025] Debmalya Pramanik, DigitPhilia INC.
********************************************************************/

INSERT INTO public.mw_currency_type (currency_type, currency_type_name, currency_type_desc, wikidata_id) VALUES
    ('F', 'Fiat Currency', 'Government issued currency which is not backed by a precious metals, nor commodities nor any other tangible assets.', 'Q240532'),
    ('C', 'Commodity Money', 'A money whosh value is derived from a commodity, and has an intrinsic value.', 'Q1470163'),
    ('R', 'Representative Money', 'A medium of exchange which has very little or no intrinsic value of its own.', 'Q7314254'),
    ('D', 'Digital Currency', 'A type of money that is stored or exchanged on digital computers over the internet.', 'Q10836209');


INSERT INTO public.mw_currency_subtype (currency_subtype, currency_subtype_name, currency_type, currency_subtype_desc, wikidata_id) VALUES
    ('C', 'Cryptocurrency', 'D', 'A digital currency that is designed to work over the network.', 'Q13479982'),
    ('F', 'Central Bank Digital Currency (CBDC)', 'D', 'A digital fiat currency which is issued by a central bank.', 'Q39086217'),
    ('S', 'Stablecoins', 'D', 'A type of cryptocurrency where the value is pegged to a referencing asset.', 'Q55582088'),
    ('V', 'Virtual Currency', 'D', 'Digital currency which are unregulated and typically controlled by its developers.', 'Q4112083');
