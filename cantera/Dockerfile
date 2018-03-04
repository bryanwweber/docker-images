FROM jupyter/minimal-notebook:latest

MAINTAINER Bryan Weber <bryan.weber@uconn.edu>

USER root

RUN conda config --add channels cantera \
    && conda install -yq \
        cantera \
        numpy \
        matplotlib \
        gmaps \
        pandas \
        && conda clean -tipsy

COPY ./docker-entrypoint.sh /srv/docker-entrypoint.sh
ENTRYPOINT ["tini", "--", "/srv/docker-entrypoint.sh"]
CMD ["start-singleuser.sh"]

USER $NB_USER
