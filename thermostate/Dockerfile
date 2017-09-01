FROM jupyter/minimal-notebook:latest

MAINTAINER Bryan Weber <bryan.weber@uconn.edu>

USER root

RUN conda config --add channels bryanwweber \
    && conda install -yq \
        thermostate \
        numpy \
        matplotlib \
        && conda clean -tipsy

COPY docker-entrypoint.sh /srv/docker-entrypoint.sh
COPY Tutorials.tar.gz /tmp/Tutorials.tar.gz
ENTRYPOINT ["tini", "--", "/srv/docker-entrypoint.sh"]
CMD ["start-singleuser.sh"]

USER $NB_USER
