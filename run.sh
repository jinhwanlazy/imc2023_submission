#!/usr/bin/env bash

docker run --rm -it \
    --gpus '"device=2"' \
    -v $PWD/deps/colmap:/kaggle/input/colmap \
    -v $PWD/deps/pycolmap:/kaggle/input/pycolmap \
    -v $PWD/scripts:/kaggle/working/scripts \
    -p 9999:9999 \
    rick_imc2023:latest \
    jupyter lab --port 9999 --ip=0.0.0.0 --no-browser --NotebookApp.token=1234 --allow-root
