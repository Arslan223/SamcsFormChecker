FROM python:3.10

RUN mkdir /base
WORKDIR /base

RUN python3 -m venv env
COPY requirements.txt .
RUN /base/env/bin/python3 -m pip install -r requirements.txt

ADD crontab /etc/cron.d/hello-cron
RUN chmod 0644 /etc/cron.d/hello-cron

RUN touch /var/log/cron.log

RUN apt-get update
RUN apt-get -y install cron


COPY . .

CMD cron && tail -f /var/log/cron.log
