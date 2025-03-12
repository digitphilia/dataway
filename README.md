<div align = "center">

# Database Highway

[![Documentation Status](https://readthedocs.org/projects/dataway/badge/?version=latest)](https://dataway.readthedocs.io/en/latest/?badge=latest&style=plastic)

</div>

<div align = "justify">

An one stop solution to manage, update and track the progress of databases at the company level. Individual schema are
created and respective permissions are given as required. The ``dataway`` ensures that high-quality data is maintained at the
company level.

## Getting Started

The repository tries to integrate data coming from different sources (open source, closed/proprietary/subscribed) and maintain
a relationship by a loosely coupled relationship constraints between different inter-connected schema. This methodology is adapted
as it serves as a comprehensive solution for advanced applications like machine learning and artificial intelligence.

### Interconnected Schema

The database is widely seperated into multiple chunks based on usability, like `global` schema namespace maybe used and maintain
master table which are global constants (like country, state name, etc.) and likely do not change over a long period of time.

### Database Standard Naming Convention

We're developing a rule set to enhance and standardize naming in the database. In addition, these will also be added under a
CI/CD pipeline to validate the table before a merger. More information is available [here](docs/standard/README.md).

</div>
