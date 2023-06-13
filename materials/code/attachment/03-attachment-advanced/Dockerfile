FROM rocker/verse:4.1.2

WORKDIR /home/rstudio/attachment

# Copy file required by renv
COPY renv.lock renv.lock
COPY renv renv
COPY .Rprofile .Rprofile

# Install packages
ENV RENV_PATHS_CACHE /home/rstudio/.cache/R/renv
RUN R -e "renv::restore()"

# Copy all project files
COPY . .

# Change ownership
RUN chown -R rstudio:rstudio /home/rstudio/
