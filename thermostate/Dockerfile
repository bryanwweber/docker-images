FROM jupyter/minimal-notebook:latest

LABEL maintainer="Bryan Weber <bryan.weber@uconn.edu>"

USER root

RUN conda config --add channels bryanwweber \
    && conda config --add channels conda-forge \
    && conda install -yq \
        thermostate \
        numpy \
        matplotlib \
        blas=*=openblas \
        convert_and_download \
        thermohw \
        python=3.6.5 \
        && conda clean -tipsy

ENV NOTEBOOK_DIR=/home/$NB_USER/work

ENTRYPOINT ["tini", "-g", "--", "/srv/docker-entrypoint.sh"]
CMD ["start-singleuser.sh"]

COPY docker-entrypoint.sh /srv/docker-entrypoint.sh
COPY Tutorials.tar.gz /tmp/Tutorials.tar.gz

USER $NB_USER
