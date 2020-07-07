FROM ubuntu:20.04

# Set timezone
ENV TZ=Europe/Warsaw
RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

# Install.
RUN \
  apt-get update && \
  apt-get -y upgrade && \
  apt-get install -y build-essential && \
  apt-get install -y software-properties-common && \
  apt-get install -y curl git htop man unzip vim wget \
  pwgen python3-pip python mlocate awscli apt-transport-https \
  ca-certificates gnupg tig ncdu oathtool mtr pigz gpa tree vim net-tools sudo \
  iputils-ping telnet netcat tcpdump nmap && \
  rm -rf /var/lib/apt/lists/*

# Add files.
ADD root/.bashrc /root/.bashrc
ADD root/.vimrc /root/.vimrc

# Set environment variables.
ENV HOME /root

# Define working directory.
WORKDIR /root

# Define default command.
CMD exec /bin/bash -c "trap : TERM INT; sleep infinity & wait"
