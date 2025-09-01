#!/bin/bash

ln -s /opt/odoo/ /workspace
pip3 install -r /workspace/extra-addons/l10n-brazil/requirements.txt --quiet
pip3 install -r /workspace/extra-addons/MutualizoAddons/requirements.txt --quiet
pip3 install -r /workspace/requirements.txt --quiet