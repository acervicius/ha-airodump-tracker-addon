FROM ubuntu:latest
# FROM debian:jessie-slim

# MAINTAINER Maik Ellerbrock (https://github.com/ellerbrock)

RUN apt-get update && \
  apt-get install --no-install-recommends -y aircrack-ng \
                                             git \
                                             pciutils \
                                             net-tools \
                                             kmod \
                                             systemctl \
                                             apt-transport-https \
                                             ca-certificates

RUN update-ca-certificates
# ENTRYPOINT ["aircrack-ng"]
# CMD ["--help"]
######### OLD DOCLERFILE
# ARG BUILD_FROM
# # FROM $BUILD_FROM
# # FROM ubuntu:latest
# FROM frapsoft/aircrack-ng

# # Install airodump-ng packages
# # RUN apt-get update
# # RUN apt-get --no-install-recommends install -y aircrack-ng git
# # Copy data for add-on
WORKDIR /
COPY run.sh /
RUN chmod a+x /run.sh
RUN mkdir /work 
WORKDIR /work
RUN git clone https://github.com/acervicius/ha-airodump-tracker.git .

RUN ln -s /work/ha-airodump-tracker/airodump-systemd/airodump.service /etc/systemd/system/airodump.service

# CMD [ "/bin/bash","pwd"]
# CMD [ "/bin/bash","ls"]
# # ENTRYPOINT [ "/run.sh" ]
ENTRYPOINT ["tail", "-f", "/dev/null"]
# # CMD [ "/bin/bash" ]
