CREATE TRIGGER trg_sl_country_currency_onupdate BEFORE UPDATE
ON public.sl_country_currency FOR EACH ROW EXECUTE PROCEDURE onupdate();
