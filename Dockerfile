FROM ubuntu:latest

MAINTAINER Srinivasa Reddy Challa <srinivasa.challa@sap.com>

RUN \
    apt-get update && \
    apt-get -y install python-dev && \
    apt-get -y install python-pip && \
    pip install --upgrade pip && \
    pip install jupyter && \
    cd ~ && \
    jupyter notebook --generate-config && \
    cd ~/.jupyter && \
    echo "c.NotebookApp.token = ''">>jupyter_notebook_config.py
    
# Command to run
#ENTRYPOINT ["jupyter notebook --allow-root"]
CMD ["jupyter", "notebook", "--allow-root"]
#CMD [""]  

# Expose listen port
EXPOSE 8888

# Expose our data directory
VOLUME ["/data"]
