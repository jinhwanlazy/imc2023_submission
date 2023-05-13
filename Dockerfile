FROM gcr.io/kaggle-gpu-images/python:v131

COPY ./inputs /kaggle/working/inputs
RUN python ./kaggle/working/inputs/unzipall.py

RUN apt-get update
RUN apt-get install -y \
    cmake \
    ninja-build \
    build-essential \
    libboost-program-options-dev \
    libboost-filesystem-dev \
    libboost-graph-dev \
    libboost-system-dev \
    libboost-test-dev \
    libeigen3-dev \
    libflann-dev \
    libfreeimage-dev \
    libmetis-dev \
    libgoogle-glog-dev \
    libgflags-dev \
    libsqlite3-dev \
    libglew-dev \
    qtbase5-dev \
    libqt5opengl5-dev \
    libcgal-dev \
    libceres-dev

COPY ./deps /kaggle/working/deps
WORKDIR /kaggle/working/deps/colmap/build
RUN cmake .. -GNinja -DCMAKE_CUDA_ARCHITECTURES=all-major && ninja && ninja install
