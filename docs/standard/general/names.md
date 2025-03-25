<div align = "center">

# General SQL Style Guide

</div>

<div>

## Registered Schema Namespace

To facilitate different projects, the database is seperated into multiple schemas to reduce workloads. In addition, database
like `postgres` allow different storage location optimization based on schema defination.

### Public (`public`) Schema

As the name suggests, the publically available information which were typically collated from open/freeware sources. The
data sources are either mentioned, or the data is available under the [seed](../../database/seed/) directory. The following
table structures are available under the public schema:

  1. World Country Tables - List of continents, regions, country, states, cities and any other related information are
    available under this table schema.
  2. World Currency Tables - List of circulated/non-circulated/digital/other forms of currency along with various other
    information is available  under this table schema.

## Constraints & Naming Convention

A set of rules are defined in place to keep consistency for the tables across different schema. The following prefix/suffix
are defined to easily recognise database elements. The following exhaustive list is available for usage.

### Table Names

A name of the table must be **singular** (`name` instead of `names`), follow **`snake_case`** and this should be consistent.
In addition, to seperate different types of tables (`master` vs `transactional`) the following affixes are to be maintained.

<div align = "center">

| Affix Type | Affix Value | Usages & Limitations | Long Description |
| :---: | :---: | :---: | --- |
| **PREFIX** | `mw_` | Table Names | Prefix for table names which stores master data. |
| **PREFIX** | `tx_` | Table Names | Prefix for table names which stores transactional data. |
| **PREFIX** | `sl_` | Table Names | Prefix for table names which connects tables from different schema. |

</div>

#### Table Views

Table views are virtual tables that present the data from one or more base tables without storing the data. The name of the
view should also be **singular**, follow **`snake_case`** and be descriptive.

<div align = "center">

| Affix Type | Affix Value | Usages & Limitations | Long Description |
| :---: | :---: | :---: | --- |
| **PREFIX** | `vw_` | Table View Names | Prefix for table view, and is typically for internal usage. |
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

</div>

> [!WARNING]
> A PR may be rejected or sent back for review if the convention is not followed.

---

<div align = "justify">

The document is presented by [Debmalya Pramanik](https://github.com/ZenithClown). Database are versatile and a business without
data is not possble. However, the way database and specifically SQL is designed, there are no standard of naming. The document
tries to fulfil this by creating an universal standard for database object naming.

</div>

<div align = "right">

Copywright © [2024] Debmalya Pramanik | 2025-02-27 15:30:00 IST

</div>
