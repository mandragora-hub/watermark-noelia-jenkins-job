#!/bin/bash

BASE_PATH="remote/dev/experiment/watermark-noelia"
INPUT_FOLDER="${BASE_PATH}/input" 
DOWNLOAD_FOLDER="${BASE_PATH}/tiktok-downloader/cli/download"

cd ${BASE_PATH}/tiktok-downloader/cli
node download-list.js

mv ${DOWNLOAD_FOLDER}/* ${INPUT_FOLDER} 

cd ${BASE_PATH}
bash scripts.sh
