FROM library/ubuntu:14.04

# Setup
RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y build-essential libssl-dev libffi-dev python-dev python-pip

# Pandas
RUN pip install pandas==0.18.0

# MySQL
RUN apt-get install -y libmysqlclient-dev && pip install mysqlclient==1.3.7

# PostgreSQL
RUN apt-get build-dep -y psycopg2 && pip install psycopg2==2.6.1

# Redshift
RUN pip install sqlalchemy-redshift==0.5.0

# Caravel
RUN pip install caravel==0.9.0

# Default config
ENV ROW_LIMIT=5000 \
    WEBSERVER_THREADS=8 \
    SECRET_KEY=\2\1thisismyscretkey\1\2\e\y\y\h \
    SQLALCHEMY_DATABASE_URI=sqlite:////home/caravel/caravel.db \
    CSRF_ENABLED=1 \
    DEBUG=1 \
    PYTHONPATH=/home/caravel/caravel_config.py:$PYTHONPATH

EXPOSE 8088

WORKDIR /home/caravel

ADD . /home/caravel
RUN chmod +x /home/caravel/start.sh

CMD /home/caravel/start.sh