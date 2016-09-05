FROM library/ubuntu:14.04

# Setup
RUN sed -i "s/http:\/\/archive.ubuntu.com/http:\/\/mirrors.aliyun.com/g" /etc/apt/sources.list && \
    apt-get update && \
    apt-get install -y build-essential libssl-dev libffi-dev python-dev python-pip

# Pandas
RUN pip install pandas==0.18.0 -i http://mirrors.aliyun.com/pypi/simple

# MySQL
RUN apt-get install -y libmysqlclient-dev && pip install mysqlclient==1.3.7 -i http://mirrors.aliyun.com/pypi/simple

# PostgreSQL
RUN apt-get build-dep -y psycopg2 && pip install psycopg2==2.6.1 -i http://mirrors.aliyun.com/pypi/simple

# Redshift
RUN pip install sqlalchemy-redshift==0.5.0 -i http://mirrors.aliyun.com/pypi/simple

# Caravel
RUN pip install caravel==0.10.0 -i http://mirrors.aliyun.com/pypi/simple

# Default config
ENV ROW_LIMIT=5000 \
    WEBSERVER_THREADS=8 \
    SECRET_KEY=\2\1thisismyscretkey\1\2\e\y\y\h \
    CSRF_ENABLED=1 \
    DEBUG=1 \
    PYTHONPATH=/home/caravel/caravel_config.py:$PYTHONPATH

EXPOSE 8088

WORKDIR /home/caravel

ADD . /home/caravel
RUN chmod +x /home/caravel/start.sh

CMD /home/caravel/start.sh
