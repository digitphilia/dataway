CREATE TRIGGER trg_tx_forex_rate_onupdate BEFORE UPDATE
ON private.tx_forex_rate FOR EACH ROW EXECUTE PROCEDURE onupdate();
