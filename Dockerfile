# Use a base image with X11 + common dev libs
FROM ubuntu:24.04

# Install packages needed by your Lumatone_Editor
# (e.g. X11 libs, libcurl, libssl, etc., plus any runtime libs)
RUN apt-get update
RUN apt install -y libasound2-dev
RUN apt install -y libcurl4-openssl-dev
RUN apt install -y libssh2-1
RUN apt install -y libxext-dev
RUN apt install -y libxcursor-dev
RUN apt install -y libxrandr-dev
RUN apt install -y libxinerama1
RUN apt install -y libxrender1
RUN apt install -y libfreetype6
RUN apt install -y libstdc++6
RUN apt install -y usbutils

RUN apt install -y fontconfig
RUN apt install -y fonts-dejavu-core
RUN apt install -y fonts-liberation

# TODO: What was this for?
#    && rm -rf /var/lib/apt/lists/*

# Copy your Lumatone_Editor binary into /opt
COPY Lumatone_Editor /opt/Lumatone_Editor

# Make it executable
RUN chmod +x /opt/Lumatone_Editor

# This is the command that will run by default when the container starts
CMD ["/opt/Lumatone_Editor"]
