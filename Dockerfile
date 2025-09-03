FROM odoo:19.0

USER root
RUN mkdir -p /workspace/

WORKDIR /workspace

COPY ./extra-addons /workspace/extra-addons
COPY ./.vscode /workspace/.vscode
COPY ./odoo.conf /etc/odoo/odoo.conf
