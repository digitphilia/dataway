/********************************************************************
A Material Master Table for All/Any Project Related Scope

The material master allows creation of unified primary key across all
the projects which in turn help in data management efficiently. In
addition, the same material code can be used across different projects
which will give us to identify potential clients from existing
collaboration by offering more services.

The material code is a globally unique identifier which is most of the
time derived from the usage of the material. The material code is a 12
digit unique value of the parts:

.. code-block:: text

    <type>-<subtype>-<material>

If a material type does not have any corresponding subtype then one
can use the `OTH` flag as subtype in derived material name. In addition,
the check constraint is added so that we do not have to manually
insert "OTH" as a subtype for all the material types.

Copywright © [2025] Debmalya Pramanik, DigitPhilia INC.
********************************************************************/

CREATE TABLE IF NOT EXISTS projects.mw_material_type (
    material_type_id
        CHAR(2)
        CONSTRAINT pk_material_type_id PRIMARY KEY,

    material_type_name
        VARCHAR(32) NOT NULL
        CONSTRAINT uq_material_type_name UNIQUE,

    material_type_desc
        VARCHAR(128)
);


CREATE TABLE IF NOT EXISTS projects.mw_material_subtype (
    material_subtype_id
        CHAR(3)
        CONSTRAINT pk_material_subtype_id PRIMARY KEY,

    material_type_id
        CHAR(2) NOT NULL
        CONSTRAINT fk_material_type_id
            REFERENCES projects.mw_material_type(material_type_id)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    material_subtype_name
        VARCHAR(32) NOT NULL
        CONSTRAINT uq_material_subtype_name UNIQUE,

    material_subtype_desc
        VARCHAR(128),

    CONSTRAINT ck_subtype_id_not_oth CHECK (
        material_subtype_id <> 'OTH'
    )
);


CREATE TABLE IF NOT EXISTS projects.mw_matetial_code (
    material_code
        CHAR(12)
        CONSTRAINT pk_material_code_id PRIMARY KEY,

    material_type_id
        CHAR(2) NOT NULL
        CONSTRAINT fk_material_code_type_id
            REFERENCES projects.mw_material_type(material_type_id)
            ON UPDATE CASCADE
            ON DELETE SET NULL,

    material_subtype_id
        CHAR(3)
        CONSTRAINT fk_material_code_subtype_id
            REFERENCES projects.mw_material_subtype(material_subtype_id)
                ON UPDATE CASCADE
                ON DELETE SET NULL,

    material_name
        VARCHAR(50) NOT NULL
        CONSTRAINT uq_material_name UNIQUE,

    material_desc
        VARCHAR(128),

    -- ! Ensure the correct material code pattern, by regex constraint
    CONSTRAINT ck_material_code_pattern CHECK (
        material_code ~* '\w{2}-\w{3}-\w{5}'
    )
);
