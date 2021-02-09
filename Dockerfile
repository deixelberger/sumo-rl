FROM ubuntu:bionic

ARG DEBIAN_FRONTEND=noninteractive

RUN apt-get -y update
RUN apt-get -y install apt-utils sudo nano
RUN apt-get -y install openssh-server
RUN apt-get -y install build-essential git cmake 

# INSTALL SUMO
RUN apt-get -y update
RUN apt-get install -y software-properties-common
RUN add-apt-repository -y ppa:sumo/stable
RUN apt-get -y update
RUN apt-get -y install sumo sumo-tools sumo-doc

ENV SUMO_HOME=/usr/share/sumo

# INSTALL PYTHON
RUN apt-get -y install python3-pip
RUN apt-get -y install python3-tk

RUN python3 -m pip install --upgrade pip

# https://stable-baselines.readthedocs.io/en/master/guide/install.html
RUN apt-get -y install libopenmpi-dev python3-dev zlib1g-dev
RUN apt-get -y install -y libsm6 libxext6
RUN apt-get -y install -y libxrender-dev

RUN python3 -m pip install opencv-python
RUN python3 -m pip install stable-baselines

# RUN python3 -m pip install sumo-rl
# RUN python3 -m pip install -e .

RUN python3 -m pip install gym numpy pandas

RUN python3 -m pip install stable-baselines3
RUN python3 -m pip install tensorflow
RUN python3 -m pip install ray[rllib]

RUN mkdir -p /home/sumo-rl/

WORKDIR /home/sumo-rl/

ENV PYTHONPATH=/home/sumo-rl/:$PYTHONPATH

ENTRYPOINT ["bash"]