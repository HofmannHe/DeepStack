ARG BASE_CONTAINER=jupyter/tensorflow-notebook
FROM $BASE_CONTAINER

LABEL maintainer="HofmannHe"

USER "${NB_USER}"
WORKDIR "/home/${NB_USER}"
COPY --chown=${NB_USER}:${NB_GID} files/.condarc .

RUN pip config set global.index-url \
    https://pypi.tuna.tsinghua.edu.cn/simple

# Install Tensorflow
RUN pip install --quiet --no-cache-dir \
    'tensorflow-gpu==2.4.1' && \
    'pytorch==1.0.2' && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"
