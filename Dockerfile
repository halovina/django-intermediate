
FROM python:3.11

# set environment variables
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

# install mysql dependencies
RUN apt-get update
RUN apt-get install gcc default-libmysqlclient-dev -y

# install dependencies
RUN pip install -U pip setuptools wheel
RUN pip install --upgrade pip

WORKDIR /code
COPY requirements.txt /code/
RUN pip install -r requirements.txt --no-cache-dir
COPY . /code/

COPY /docker-entrypoint.sh /docker-entrypoint.sh
RUN chmod +x /docker-entrypoint.sh