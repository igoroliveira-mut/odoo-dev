FROM ubuntu:20.04

ENV DEBIAN_FRONTEND=noninteractive \
    PYTHONUNBUFFERED=1 \
    LANG=C.UTF-8

RUN apt-get update && apt-get upgrade -y && \
    apt-get install -y \
    software-properties-common 

RUN add-apt-repository ppa:deadsnakes/ppa -y

RUN apt-get update && \
    apt-get install -y \
    software-properties-common \
    wget \
    curl \
    git \
    unzip \
    build-essential \
    libssl-dev \
    libffi-dev \
    libxml2-dev \
    libxslt1-dev \
    zlib1g-dev \
    libsasl2-dev \
    libldap2-dev \
    pkg-config \
    libjpeg-dev \
    libpq-dev \
    libjpeg8-dev \
    liblcms2-dev \
    libblas-dev \
    libatlas-base-dev \
    python3.8 \
    python3.8-dev \
    python3.8-venv \
    python3-pip \
    python3-dev \
    python3-venv \
    postgresql-client \
    && rm -rf /var/lib/apt/lists/*

RUN git clone https://github.com/odoo/odoo.git --depth 1 --branch 14.0 --single-branch /opt/odoo

RUN python3.8 -m pip install --upgrade pip wheel setuptools
RUN python3.8 -m pip install psycopg2-binary
RUN python3.8 -m pip install -r /opt/odoo/requirements.txt

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - \
    && apt-get install -y nodejs \
    && npm install -g rtlcss less clean-css postcss postcss-cli sass

COPY ./odoo.conf /workspace/odoo.conf
COPY ./requirements.txt /workspace/requirements.txt
COPY ./.vscode /workspace/.vscode

WORKDIR /workspace
