#!/bin/bash

if [[ ${DBBSI} ]]; then
    eval export SQLALCHEMY_DATABASE_URI=\$BSI_${DBBSI}_URI
    /usr/local/bin/fabmanager create-admin --app caravel < admin.config
    caravel db upgrade
    caravel init
    #caravel load_examples
fi

caravel runserver -d
