<div align = "center">

# General SQL Style Guide

</div>

<div align = "justify">

The database schema consists of multiple data tables across varied domains which are loosely coupled to from the entire
database. The following conventions are to be enforced while commiting to this repository to keep the schema, table and
other objects in sync and consistent across the database.

  1. All the **_names_** (table, views, columns) are to be defined in **_singular_** form, for example the table name must 
    be `data_source` instead of `data_sources` and the same rule is applied for column names,
  2. Schema names are to be placed infront of the table name since we are dealing with multiple schemas and postgres
    offers the flexibility to save schema on a different location based on usage.
  3. Store date and/or datetime in [ISO 8601](https://en.wikipedia.org/wiki/ISO_8601) standard(`YYYY-MM-DD HH:MM:SS.SSSSS`)
    format, and always try to keep the date in UTC.
  4. Use C styling for multiline comment `/* ... */` eherever necessary, else follow a `--` and then leave a blank line for
    improved readability of the code.

```{toctree}
:maxdepth: 2
:hidden:

names.md
syntax.md
```

</div>
