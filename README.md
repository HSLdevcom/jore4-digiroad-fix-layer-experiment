# jore4-digiroad-fix-layer-experiment

As a user, I want to combine Digiroad map data with fixes from HSL so that the result can be used as part of the infrastructure network in Jore4.

jore4-digiroad-fix-layer-experiment iterates on the process of creating the fixes.

## Usage

1. Install QGIS.
1. If you are not using `git`, download and unzip a [copy of this repository](https://github.com/HSLdevcom/jore4-digiroad-fix-layer-experiment/archive/refs/heads/main.zip).
1. Open `jore4-digiroad-fix-project.qgz`.
1. Create new linestrings with attributes in the layer `jore4-digiroad-fix-layer`.
1. Upload the new `jore4-digiroad-fix-layer.gpkg` into [`fixes/`](./fixes).

## Attributes of new links

Eventually the new links need these attributes:

- unique ID (may be generated without user interaction)
- valid time (`LINK_TILA` in Digiroad or a PostgreSQL `tstzrange` style interval)
- direction of travel (`AJOSUUNTA` in Digiroad)
- valid vehicle types for each link
- level of link (`SILTA_ALIK` in Digiroad)

The links will have a Z coordinate.
It makes sense for the Z coordinate to not conflict with the level of the link when compared to the Z coordinates of the surrounding links.

## Update Digiroad

Run:

1. `./get-digiroad.sh`
   This will download the latest Digiroad release for Uusimaa.
1. `./split.sh`
   This will split files too large for GitHub into two.

### Digiroad extract type

Currently this repository uses Digiroad extract type R.
It seems to carry the latest features which are later ported onto type K.
E.g. 2021-06 release included new turning restrictions in R but not in K.

## License

The project license is in [`LICENSE`](./LICENSE).

Digiroad data has been licensed with Creative Commons BY 4.0 license by the [Finnish Transport Infrastructure Agency](https://vayla.fi/en/transport-network/data/digiroad/data).
