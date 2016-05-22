#!/bin/bash

if [[ ${DBBSI} ]]; then
    eval SQLALCHEMY_DATABASE_URI=\$BSI_${SPARKBSI}_URI
    export SQLALCHEMY_DATABASE_URI
    /usr/local/bin/fabmanager create-admin --app caravel < admin.config
    caravel db upgrade
    caravel init
    caravel load_examples
fi

caravel runserver -d
