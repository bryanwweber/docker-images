FROM jupyter/minimal-notebook:latest

LABEL maintainer="Bryan Weber <bryan.weber@uconn.edu>"

USER root

# ffmpeg for matplotlib anim
RUN apt-get update && \
    apt-get install -y --no-install-recommends ffmpeg && \
    rm -rf /var/lib/apt/lists/*

USER $NB_UID

RUN conda config --remove channels defaults
RUN conda config --system --append channels bryanwweber
RUN conda update --quiet --yes conda
RUN conda config --set pip_interop_enabled True
RUN conda update --all --quiet --yes
RUN conda install --quiet --yes \
    'thermostate=1.2.0' \
    'convert_and_download=0.3.0' \
    'thermohw=0.6.0' && \
    conda clean --all --yes && \
    fix-permissions $CONDA_DIR && \
    fix-permissions /home/$NB_USER

# CoolProp 6.4.0 is only available from pip
RUN python -m pip install -U CoolProp==6.4.0

ENV NOTEBOOK_DIR=/home/$NB_USER

ENTRYPOINT ["tini", "-g", "--", "/srv/docker-entrypoint.sh"]
CMD ["start-singleuser.sh"]

COPY docker-entrypoint.sh /srv/docker-entrypoint.sh
COPY Tutorials.tar.gz /tmp/Tutorials.tar.gz

USER $NB_UID
