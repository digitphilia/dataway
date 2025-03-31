/********************************************************************
Static General Rules for Classification of Traded Materials

The general rules [GR1, GR2, ..., GR3] guides a trader to classify
goods into a sepecific category. The information is static and is kept
for information purpose only - until a usecase is identified.

Copywright © [2025] Debmalya Pramanik, DigitPhilia INC.
********************************************************************/

CREATE TABLE IF NOT EXISTS static.mw_general_rule (
    general_rule_id
        CHAR(3)
        CONSTRAINT pk_general_rule_id PRIMARY KEY,

    general_rule_desc
        VARCHAR(156) NOT NULL
);


CREATE TABLE IF NOT EXISTS static.mw_general_subrule (
    general_subrule_id
        CHAR(4)
        CONSTRAINT pk_general_subrule_id PRIMARY KEY,

    general_rule_id
        CHAR(3) NOT NULL
        CONSTRAINT fk_general_rule_id
            REFERENCES static.mw_general_rule(general_rule_id)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    general_subrule_desc
        VARCHAR(512) NOT NULL
);
