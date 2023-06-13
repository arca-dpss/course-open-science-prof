FROM ubuntu:18.04

# Install Nano
RUN apt-get update \
    && apt-get install nano


# add user
RUN useradd -ms /bin/bash arca

# Copy files
COPY arca/ /home/arca 
RUN chown -R arca /home/arca

USER arca

WORKDIR /home/arca
