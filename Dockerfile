ARG BASE_CONTAINER=jupyter/tensorflow-notebook
FROM $BASE_CONTAINER

LABEL maintainer="HofmannHe"

USER "${NB_USER}"
WORKDIR "/home/${NB_USER}"

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir tensorflow-gpu==2.4.1 && \
    pip install --no-cache-dir torch==1.7.1 && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

### for chinese users ###
ADD --chown=${NB_USER}:${NB_GID} files/.condarc .

RUN pip config set global.index-url \
    https://pypi.tuna.tsinghua.edu.cn/simple
### for chinese users ###

