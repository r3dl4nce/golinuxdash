#
# Dockerfile for linux-dash
#    listen on port 9080
#
FROM debian 
MAINTAINER r3dl4nce r3dl4nce@gmail.com

# Install Go
RUN                                    \
   apt-get update                   && \
   apt-get -y install                  \
                golang curl unzip   && \
   rm -rf /var/lib/apt/lists/* 


# Download and extract linux-dash
WORKDIR /opt
RUN curl -k -L -o master.zip https://github.com/afaqurk/linux-dash/archive/master.zip    && \
    unzip master.zip                                                                     && \
    rm master.zip

# Compile server with Go
WORKDIR /opt/linux-dash-master/server
RUN go build

ENTRYPOINT ["/opt/linux-dash-master/server/server"]
CMD ["-listen=0.0.0.0:9080"]


EXPOSE 9080

