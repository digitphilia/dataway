<h1 align = "center">Dataway Documentation</h1>

<div align = "justify">

```{toctree}
:maxdepth: 2
:hidden:
:caption: Getting Started

standard/index.md
```

```{toctree}
:maxdepth: 3
:hidden:
:caption: Database Design

schema/index.md
```

```{toctree}
:maxdepth: 2
:hidden:
:caption: Other Essentials

whatsnew/index.md
```

An one stop solution to manage, update and track the progress of databases at the company level. Individual schema are
created and respective permissions are given as required. The ``dataway`` ensures that high-quality data is maintained at the
company level.

## Getting Started

The **`database`** directory contains code samples (table, function, stored procedures, etc.) that represents all the data
that are tracked, updated and used for different purposes. The directory structure follows simple standard by seperating each
data by schema names. The *losely coupled database design* ensures enduser to specifically break links between two different
schema at will by removing the foreign key constraints.

The repository aims to connect data coming from different sources and create an unified interface for controlling for the
developers. In addition, any internal database are added as a submodule and may only be accesible to an enduser if necessary
permission is available.

The internal database uses [Postgre SQL](https://www.postgresql.org/) with [MongoDB](https://www.mongodb.com/), however there
maybe a requirement for setup in a differnt flavor for which an independent database migration script is being prepared.

</div>
