<h1 align = "center">Database Schema Design</h1>

<div align = "justify">

The database schema consists of multiple data tables across varied domains which are loosely coupled to from the entire
database. The following conventions are to be enforced while commiting to this repository to keep the schema, table and
other objects in sync and consistent across the database.

- all the **_names_** (table, views, columns) are to be defined in **_singular_** form, for example the table name must
  be `data_source` instead of `data_sources` and the same rule is applied for column names,
- schema names are to be placed infront of the table name since we are dealing with multiple schemas and postgres
  offers the flexibility to save schema on a different location based on usage.

<div align = "center">

| PREFIX | Long Description |
| :----: | :--------------: |

```
# 🚧 TODO Documentation
  - `mw_` - used for table names which stores the master data, and are typically not a transactional table,
  - `_id` - typically the primary key for a transactional table of type `*serial` stored in the database,
  - `uq_` - prefix for the named unique constraint for a table column,
  - `pk_` - prefix for the named primary key constraint for a table column, and
  - `fk_` - prefix for the named foreign key constraing for a table column.
```

</div>

</div>
