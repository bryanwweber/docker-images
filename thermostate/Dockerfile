FROM jupyter/minimal-notebook:latest

LABEL maintainer="Bryan Weber <bryan.weber@uconn.edu>"

USER root

RUN conda config --add channels bryanwweber \
    && conda install -yq \
        thermostate \
        numpy \
        matplotlib \
        && conda clean -tipsy

RUN /opt/conda/bin/pip install git+https://github.com/bryanwweber/convert_and_download \
    && jupyter nbextension install --py convert_and_download --sys-prefix \
    && jupyter nbextension enable --py convert_and_download --sys-prefix \
    && jupyter serverextension enable --py convert_and_download --sys-prefix

COPY docker-entrypoint.sh /srv/docker-entrypoint.sh
COPY Tutorials.tar.gz /tmp/Tutorials.tar.gz
ENTRYPOINT ["tini", "--", "/srv/docker-entrypoint.sh"]
CMD ["start-singleuser.sh"]

USER $NB_USER
