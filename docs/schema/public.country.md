<h1 align = "center">Country Schema</h1>

<div align = "justify">

The country schema stores high level geographical information like the continent, regions and sub-regions details along
with their mapping and details with country, states and cities information.

## CHANGELOG

All notable changes to this project will be documented in this file. The format is based on
[Keep a Changelog](https://keepachangelog.com/en/1.1.0/) styling guide. Individual schema is tracked seperately with an
unique version number.

The `major.minor` patch are indicated under `h3` tags, while the micro and "version identifiers" are listed under `h4` and
subsequent headlines.

<details>
<summary>Click Here to View Legend</summary>

  * 🎉 - **Major Feature** : something big that was not available before.
  * ✨ - **Feature Enhancement** : a miscellaneous minor improvement of an existing feature.
  * 🛠️ - **Patch/Fix** : something that previously didn’t work as documented – or according to reasonable expectations – should now work.
  * ⚙️ - **Code Efficiency** : an existing feature now may not require as much computation or memory.
  * 💣 - **Code Refactoring** : a breakable change often associated with `major` version bump.

</details>

Each version is randomly named using [GitHub Repository Name Generator](https://alator21.github.io/repository-name-generator/),
and the same is added in the version heading.

<details>
<summary>Click Here to Open Detailed Changelog</summary>

### v1.0 | Entertaining Locket

The version aims to provide a default schema to track geographical boundaries. For more details on the use case, check
the initial [story #3](https://github.com/digitphilia/dataway/issues/3) for more details.

#### v1.0.1 | Release Date: 2025-02-25

  * 🛠️ Explicitly state not null constraint to column names, like country name, as `postgres` considers `NULL` as noise
    and also these column should not be null value.
  * ⚙️ Set `wikidata_id` column as `VARCHAR(8)` instead of `VARCHAR(16)` for all the columns.
  * ✨ Add `wikidata_id` and `country_flag_uri` for developer usage and decoration purposes, however both the constraint
    are currently nullable (GH#7).
  * 💣 Remove continent foreign key constraint from regions as regions is a combination of some continents or some other
    larger land mases that makes it difficult to map with the continent.

#### v1.0.0 | Release Date: 2025-02-24

  * 🎉 The world is divided into seven continent ([details](https://en.wikipedia.org/wiki/Continent)) - which are generally
    identified by convention rather than any strict criteria.
    - most of the world considers seven continents by default, which is defined in the schema, while
    - other variation combines several regions to make a fewer continents which are excluded from this schema.
  * 🎉 Each continent is divided into several different regions and subregions. Refer to the Wiki Data ID associated with
    each data to get additional information.
  * 🎉 A [country](https://en.wikipedia.org/wiki/Country) is a distinct entity which is a political boundary and a unique
    identification number is provided by the International Organization for Standardization (ISO).
  * 🎉 Added states and cities information along with latitude and longitude details. The latitude and longitude can be
    essentially used for additional tracking like weather etc. details.
    - a state code is a unique five digit code which is a combination of country code and two digit state code seperated by
      a slash.
    - the convention ensures uniqueness of state code globally and also restricts entry of two of the same state code for
      a country.
    - typically, a state name should be unique across the world while the city name may not be unique - this constraint is
      thus placed and defined accordingly.

</details>

</div>
