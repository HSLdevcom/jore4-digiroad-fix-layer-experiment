#!/bin/bash
#
# Split large shapefiles by feature ID into odd and even. Works well enough with
# Digiroad. Requires ogr2ogr.

set -Eeuo pipefail

DIGIROAD_DIR='./digiroad'

split_file() {
  large_file_path="$1"
  filename_without_extension="${large_file_path%.*}"
  even_path="${filename_without_extension}_EVEN_LINK_ID.shp"
  odd_path="${filename_without_extension}_ODD_LINK_ID.shp"

  # FIXME: Expect file to have attribute LINK_ID.
  #
  # Shapefile feature ID (FID) might not be stable between Digiroad releases.
  ogr2ogr \
    -f 'ESRI Shapefile' \
    -where 'CAST(LINK_ID AS bigint) % 2 = 0' \
    "${even_path}" \
    "${large_file_path}"
  ogr2ogr \
    -f 'ESRI Shapefile' \
    -where 'CAST(LINK_ID AS bigint) % 2 = 1' \
    "${odd_path}" \
    "${large_file_path}"
  rm "${filename_without_extension}."*
}

# Split files larger than 80 MiB.
find "${DIGIROAD_DIR}" -type f -size '+80M' \
  | while IFS= read -r file; do
    split_file "${file}"
  done
