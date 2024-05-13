#!/bin/bash

BASE_PATH="/home/mandragora/remote/dev/experiment/watermark-noelia"
INPUT_FOLDER="${BASE_PATH}/input" 
DOWNLOAD_FOLDER="${BASE_PATH}/tiktok-downloader/cli/downloads"

cd ${BASE_PATH}/tiktok-downloader/cli
node download-list.js

mv ${DOWNLOAD_FOLDER}/* ${INPUT_FOLDER} 

cd ${BASE_PATH}
bash script.sh
