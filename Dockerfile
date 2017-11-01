FROM ubuntu:latest

MAINTAINER Srinivasa Reddy Challa <srinivasa.challa@sap.com>

RUN \
    apt-get update && \
    apt-get -y install python-dev && \
    apt-get -y install python-pip && \
    pip install --upgrade pip && \
    pip install jupyter

# Command to run
ENTRYPOINT ["jupyter notebook --allow-root"]   
CMD [""]  

# Expose listen port
EXPOSE 8888

# Expose our data directory
VOLUME ["/data"]
