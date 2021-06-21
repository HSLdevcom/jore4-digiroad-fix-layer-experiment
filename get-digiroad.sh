#!/bin/bash

set -Eeuo pipefail

COMMON_SUBPATH='digiroad/latest/Maakuntajako_DIGIROAD_R_EUREF-FIN'
DIGIROAD_DIR="${COMMON_SUBPATH}/UUSIMAA"
ZIP_FILE='UUSIMAA.zip'
URL="https://aineistot.vayla.fi/${COMMON_SUBPATH}/${ZIP_FILE}"

wget --directory-prefix "${DIGIROAD_DIR}" "${URL}"
unzip -d "${DIGIROAD_DIR}" "${DIGIROAD_DIR}/${ZIP_FILE}"
rm "${DIGIROAD_DIR}/${ZIP_FILE}"
