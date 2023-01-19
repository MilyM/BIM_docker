FROM ubuntu

# Install base utilities
RUN apt-get update && \
    apt-get install -y wget && \
    apt-get clean &&\
    rm -rf /var/lib/apt/lists/*

# Install miniconda
ENV CONDA_DIR /opt/conda
RUN wget --quiet https://repo.anaconda.com/miniconda/Miniconda3-latest-Linux-x86_64.sh -O ~/miniconda.sh && \
     /bin/bash ~/miniconda.sh -b -p /opt/conda
ENV PATH=$CONDA_DIR/bin:$PATH

# install ifcopenshell library
RUN conda install -c conda-forge ifcopenshell

# scirpit which is countig the walls in file
COPY wall_count.py /.
# ifc file name 
COPY 231110AC-11-Smiley-West-04-07-2007.ifc /.

CMD ["python", "wall_count.py"]