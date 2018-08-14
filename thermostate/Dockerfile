FROM jupyter/minimal-notebook:latest

LABEL maintainer="Bryan Weber <bryan.weber@uconn.edu>"

USER root

RUN conda config --add channels bryanwweber \
    && conda install -yq \
    && conda config --add channels conda-forge \
        thermostate \
        numpy \
        matplotlib \
        blas=*=openblas \
        convert_and_download \
        thermohw \
        python=3.6.5 \
        && conda clean -tipsy


COPY docker-entrypoint.sh /srv/docker-entrypoint.sh
COPY Tutorials.tar.gz /tmp/Tutorials.tar.gz
ENTRYPOINT ["tini", "--", "/srv/docker-entrypoint.sh"]
CMD ["start-singleuser.sh"]

USER $NB_USER
