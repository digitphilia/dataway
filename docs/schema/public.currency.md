<h1 align = "center">Country Schema</h1>

<div align = "justify">

The currency schema stores high level currency information like name, symbol, codes and other various information which maybe
useful for certain internal projects and data analysis methodologies.

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
  * 🛠️ - **Patch/Fix** : something that previously didn't work as documented - or according to reasonable expectations - should now work.
  * ⚙️ - **Code Efficiency** : an existing feature now may not require as much computation or memory.
  * 💣 - **Code Refactoring** : a breakable change often associated with `major` version bump.

</details>

Each version is randomly named using [GitHub Repository Name Generator](https://alator21.github.io/repository-name-generator/),
and the same is added in the version heading.

<details>
<summary>Click Here to Open Detailed Changelog</summary>

### v1.0 | Flashy Fire

The version aims to provide a default schema to track currency information. For more details on the use case, check
the initial [story #4](https://github.com/digitphilia/dataway/issues/4) for more details.

#### v1.0.0 | Release Date: 2025-02-27

  * 🎉 A master *metadata* table that tracks currency type and subtypes. It creates a unique primary key which are
    referenced in the currency details table.
  * 🎉 Add currency details like name, symbol and minor units information with relevant check information.

</details>

</div>
