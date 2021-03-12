ARG BASE_CONTAINER=minduploading/dl-container-base
FROM $BASE_CONTAINER

LABEL maintainer="HofmannHe"

USER root

# RUN apt-get update && \
#     apt-get install -y --no-install-recommends ffmpeg dvipng cm-super && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

WORKDIR "/home/${NB_USER}"

RUN pip install --no-cache-dir tushare && \
    pip install --no-cache-dir backtrader[plotting] &&
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

USER $NB_UID
