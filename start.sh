#!/bin/bash

if [[ ${DBBSI} ]]; then
    eval export SQLALCHEMY_DATABASE_URI=\$BSI_${DBBSI}_URI
    sed -i 's^#DBBSI#^'$SQLALCHEMY_DATABASE_URI'^' /home/caravel/caravel_config.py
    /usr/local/bin/fabmanager create-admin --app caravel < admin.config
    caravel db upgrade
    caravel init
    #caravel load_examples
fi
echo "SQLALCHEMY_DATABASE_URI:"${SQLALCHEMY_DATABASE_URI}
caravel runserver -d