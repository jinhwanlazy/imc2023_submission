FROM gcr.io/kaggle-gpu-images/python:v131

COPY ./inputs /kaggle/working/inputs
RUN python ./kaggle/working/inputs/unzipall.py

WORKDIR /kaggle/working


