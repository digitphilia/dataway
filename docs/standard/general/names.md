<div align = "center">

# Naming Convention

</div>

<div align = "justify">

The standard naming conventions are to be followed while creating any object (table, views, columns, functions, etc.) in the
repository, else a PR maybe rejected due to non-compliance. The general naming rules are as follows:

  * All the **_names_** (table, views, columns) are to be defined in **_singular_** form, for example the table name must 
    be `data_source` instead of `data_sources` and the same rule is applied for column, functions, views, etc. names.
  * Keep the length to a maximum of 30 characters and should always be simple ASCII characters.
  * Follow **`snake_case`** naming convention.

## Table Names

A name of the table must be **singular** (`name` instead of `names`), follow **`snake_case`** and this should be consistent.
In addition, to seperate different types of tables (`master` vs `transactional`) the following affixes
[**Hungarian Notation**](https://en.wikipedia.org/wiki/Hungarian_notation) are to be maintained.

<div align = "center">

| Affix Type | Affix Value | Usages & Limitations | Long Description |
| :---: | :---: | :---: | --- |
| **PREFIX** | `mw_` | Table Names | Prefix for table names which stores **master** data. |
| **PREFIX** | `trx_` | Table Names | Prefix for table names which stores **transactional** data. |
| **PREFIX** | `sl_` | Table Names | Prefix for table names which connects tables (**softlinks**) from different schema. |
| **PREFIX** | `sbl_` | Table Names | Prefix for table names which connects tables (**soft-broken links**) from different schema. |

</div>

### Table Views

Table views are virtual tables that present the data from one or more base tables without storing the data. The name of the
view should also be **singular**, follow **`snake_case`** and be descriptive.

<div align = "center">

| Affix Type | Affix Value | Usages & Limitations | Long Description |
| :---: | :---: | :---: | --- |
| **PREFIX** | `uvw_` | Table View Names | General prefix for table view, and is typically for enduser/API usage. |
| **PREFIX** | `ivw_` | Table View Names | Prefix for table view, and is typically for internal usage. |
| **PREFIX** | `pvw_` | Table View Names | Parametric table views which are typically to be used for internal usages and control. |
| **PREFIX** | `rvw_` | Table View Names | Prefix for table views which are for reporting and often have decorated column names. |

</div>

### Other Programibility

SQL database (like `postgres`) offers many other programibility features like stored procedures, functions, etc. They should also
follow **singular** and **`snake_case`** naming convention. The following affixes are defined.

<div align = "center">

| Affix Type | Affix Value | Usages & Limitations | Long Description |
| :---: | :---: | :---: | --- |
| **PREFIX** | `udf_` | Function Names | User defined function names. |
| **PREFIX** | `usp_` | Stored Procedures | User defined stored procedures names. |

</div>

The conventions are defined to maintain consistency across the wide schema consisting of multiple tables, and other informations.
These conventions is not universal and some might be very specific to this organization, so if you are a first time contributor
do read the content carefully before opening a pull request.

## Column Names

A name of the column must be **singular** (`name` instead of `names`), follow **`snake_case`** and this should be consistent.
In addition, the following checks should be maintained:

  * Primary key should not be named `id` instead should be descriptive like `member_id`, `file_id`, etc.
  * The transactional table (`trx_*`) may have an identity/primary key column `_id` which denotes that the key is only
    for database/API usage and has no particular usages.
  * The column name must not be same as that of the table name, and vice versa is also applicable.

### Uniform Affixes

The following affixes are associated with a column name and have an universal meaning ensuring the columns can be read and
understood easily from the SQL code.

<div align = "center">

| Affix Type | Affix Value | Usages & Limitations | Long Description |
| :---: | :---: | :---: | --- |
| **SUFFIX** | `_id` | An unique identifier, typically a primary key for the table. |
| **SUFFIX** | `_status` | Flag value, like `active_status`, of boolean or any other type. |
| **SUFFIX** | `_date` | Signifies a column that contains date of something and should often be indexed. |
| **SUFFIX** | `_datetime` | Like `_date` denotes an associated time value and proper indexing should be done. |

</div>

### Constant Column Names

The following column names are constant, typically associated with an transactional table, and the same are as follows:

<div align = "center">

| Column Name | Affix Value | Usages & Limitations | Long Description |
| :---: | :---: | :---: | --- |
| **SUFFIX** | `_id` | An unique identifier, typically a primary key for the table. |
| **SUFFIX** | `_status` | Flag value, like `active_status`, of boolean or any other type. |
| **SUFFIX** | `_date` | Signifies a column that contains date of something and should often be indexed. |
| **SUFFIX** | `_datetime` | Like `_date` denotes an associated time value and proper indexing should be done. |

</div>

</div>

> [!WARNING]
> A PR may be rejected or sent back for review if the convention is not followed.
