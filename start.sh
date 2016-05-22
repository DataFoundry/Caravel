#!/bin/bash

if [[ ${DBBSI} ]]; then
    eval SQLALCHEMY_DATABASE_URI=\$BSI_${SPARKBSI}_URI
    export SQLALCHEMY_DATABASE_URI
fi

/usr/local/bin/fabmanager create-admin --app caravel < admin.config
caravel db upgrade
caravel init
caravel load_examples
caravel runserver -d