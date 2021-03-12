ARG BASE_CONTAINER=minduploading/dl-container-base
FROM $BASE_CONTAINER

LABEL maintainer="HofmannHe"

USER root

# RUN apt-get update && \
#     apt-get install -y --no-install-recommends ffmpeg dvipng cm-super && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

USER $NB_UID

WORKDIR "/home/${NB_USER}"

RUN pip install --no-cache-dir --upgrade pip && \
#     conda install --quiet --yes -c anaconda tensorflow-gpu && \
#     conda install --quiet --yes -c pytorch pytorch && \
#     conda clean --all -f -y && \
#    pip install --no-cache-dir tensorflow-gpu==2.4.1 && \
#    pip install --no-cache-dir torch==1.7.1 && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"


### for chinese users ###
ADD --chown=${NB_UID}:${NB_GID} files/.condarc .

RUN pip config set global.index-url \
    https://pypi.tuna.tsinghua.edu.cn/simple
### for chinese users ###

USER $NB_UID
