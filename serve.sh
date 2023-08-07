#!/bin/bash

if [ $1 == "start" ]; then
  docker rm StatusFileServer
  DATA_FOLDER=/home/byzek/home-services/data/status
  WEBUI_PORT=9898

  mkdir -p $DATA_FOLDER

  docker run --name StatusFileServer \
             --network host \
             -v $DATA_FOLDER:/srv \
             --restart on-failure \
             csvserve -b 172.17.0.1 -p $WEBUI_PORT

else
  docker stop StatusFileServer && docker rm StatusFileServer
fi

