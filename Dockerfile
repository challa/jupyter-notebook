FROM ubuntu:latest

MAINTAINER Srinivasa Reddy Challa <srinivasa.challa@sap.com>

RUN DEBIAN_FRONTEND=noninteractive \
    cd /tmp && \
    apt-get update && \
    apt-get -y install python-dev && \
    apt-get -y install python-pip && \
    pip install --upgrade pip && \
    pip install jupyter


# Add scripts
ADD scripts /scripts
RUN chmod +x /scripts/*.sh
RUN touch /.firstrun

# Command to run
ENTRYPOINT ["/bin/bash", "jupyter notebook --allow-root"]   
CMD [""]  

# Expose listen port
EXPOSE 8888

# Expose our data directory
VOLUME ["/data"]
