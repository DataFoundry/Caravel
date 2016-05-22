#!/bin/bash

if [[ ${DBBSI} ]]; then
    eval export SQLALCHEMY_DATABASE_URI=\$BSI_${DBBSI}_URI
    
    echo "SQLALCHEMY_DATABASE_URI:"${SQLALCHEMY_DATABASE_URI}
    /usr/local/bin/fabmanager create-admin --app caravel < admin.config
    echo "SQLALCHEMY_DATABASE_URI:"${SQLALCHEMY_DATABASE_URI}
    caravel db upgrade
    echo "SQLALCHEMY_DATABASE_URI:"${SQLALCHEMY_DATABASE_URI}
    caravel init
    echo "SQLALCHEMY_DATABASE_URI:"${SQLALCHEMY_DATABASE_URI}
    #caravel load_examples
    echo "SQLALCHEMY_DATABASE_URI:"${SQLALCHEMY_DATABASE_URI}
fi
echo "SQLALCHEMY_DATABASE_URI:"${SQLALCHEMY_DATABASE_URI}
caravel runserver -d
