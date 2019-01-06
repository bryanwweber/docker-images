FROM jupyter/minimal-notebook:latest

LABEL maintainer="Bryan Weber <bryan.weber@uconn.edu>"

USER root

RUN conda config --add channels bryanwweber \
    && conda config --add channels conda-forge \
    && conda install -yq \
        thermostate=0.5.1 \
        convert_and_download=0.2.3 \
        thermohw=0.4.2 \
        python=3.7 \
        numpy \
        matplotlib \
        blas=*=openblas \
        && conda clean -tipsy

ENV NOTEBOOK_DIR=/home/$NB_USER

ENTRYPOINT ["tini", "-g", "--", "/srv/docker-entrypoint.sh"]
CMD ["start-singleuser.sh"]

COPY docker-entrypoint.sh /srv/docker-entrypoint.sh
COPY Tutorials.tar.gz /tmp/Tutorials.tar.gz

USER $NB_USER
