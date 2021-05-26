ARG BASE_CONTAINER=cschranz/gpu-jupyter:v1.4_cuda-11.0_ubuntu-20.04_python-only
FROM $BASE_CONTAINER

LABEL maintainer="HofmannHe"

# USER root
# RUN apt-get update && \
#     apt-get install -y --no-install-recommends ffmpeg dvipng cm-super && \
#     apt-get clean && rm -rf /var/lib/apt/lists/*

USER $NB_UID

WORKDIR "/home/${NB_USER}"

ADD files/requirements.txt .

RUN pip install --no-cache-dir --upgrade pip && \
    pip install --no-cache-dir -r requirements.txt

USER root
RUN jupyter labextension install jupyterlab-spreadsheet && \
#    jupyter labextension install nbgather && \
    jupyter labextension install jupyterlab-dash && \
#    jupyter labextension install jupyterlab-execute-time && \
    jupyter labextension install jupyterlab-spreadsheet && \
    jupyter labextension install @kiteco/jupyterlab-kite && \
    jupyter lab clean && \
    conda clean --all -f -y && \
    rm -rf /home/$NB_USER/.cache/yarn && \
    fix-permissions "${CONDA_DIR}" && \
    fix-permissions "/home/${NB_USER}"

USER $NB_UID

### for chinese users ###
RUN pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
ADD files/.condarc .
### for chinese users ###
