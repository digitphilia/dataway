CREATE TRIGGER trg_sl_country_hscode_onupdate BEFORE UPDATE
ON public.sl_country_hscode FOR EACH ROW EXECUTE PROCEDURE onupdate();
