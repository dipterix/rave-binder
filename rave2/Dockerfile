FROM rocker/rstudio:4.3.1

## Declares build arguments
ENV NB_USER=rstudio

COPY --chown=${NB_USER} . ${HOME}

USER root

COPY configure-root.sh /rave_scripts/configure-root.sh
COPY launcher.R /rave_scripts/launcher.R
RUN sudo bash /rave_scripts/configure-root.sh

USER ${NB_USER}

## Run an install.R script, if it exists.
RUN if [ -f install.R ]; then R --quiet -f install.R; fi

WORKDIR /home/${NB_USER}
EXPOSE 17284

CMD ["Rscript", "--no-restore", "--no-save", "/rave_scripts/launcher.R"]
