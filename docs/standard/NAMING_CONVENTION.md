<h1 align = "center">Database Schema Design</h1>

<div align = "justify">

The database schema consists of multiple data tables across varied domains which are loosely coupled to from the entire
database. The following conventions are to be enforced while commiting to this repository to keep the schema, table and
other objects in sync and consistent across the database.

  - all the **_names_** (table, views, columns) are to be defined in **_singular_** form, for example the table name must
    be `data_source` instead of `data_sources` and the same rule is applied for column names,
  - schema names are to be placed infront of the table name since we are dealing with multiple schemas and postgres
    offers the flexibility to save schema on a different location based on usage.

## Registered Schema Namespace

To facilitate different projects, the database is seperated into multiple schemas to reduce workloads. In addition, database
like `postgres` allow different storage location optimization based on schema defination.

  - **`meta`** - default database for metadata tables like countries, currency master etc. which are static and does not
    change over a long period of time,
  - **`private`** - a private schema namespace which may be specific to a project/client and should be accessed only by the
    database owner and/or administrators,
  - **`trade`** - namespace to hold transactional table(s) for data related to import export data of materials,
  - **`dbo`** - the default schema of `mssql` will be used to held transactional tables like forex rates which needs to be
    accessed by multiple projects.

<div align = "center">

| PREFIX | Long Description |
| :----: | :--------------: |

</div>

```
# 🚧 TODO Documentation
  - `mw_` - used for table names which stores the master data, and are typically not a transactional table,
  - `_id` - typically the primary key for a transactional table of type `*serial` stored in the database,
  - `uq_` - prefix for the named unique constraint for a table column,
  - `pk_` - prefix for the named primary key constraint for a table column, and
  - `fk_` - prefix for the named foreign key constraing for a table column.
```

</div>
