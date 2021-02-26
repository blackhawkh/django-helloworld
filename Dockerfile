FROM python:3.7-stretch

RUN mkdir /app

ADD . /app

RUN cd /app && pip install -r requirements.txt
WORKDIR /app

ENV PORT=9000

#HEALTHCHECK --interval=5s --timeout=2s --retries=1 CMD /bin/bash -c 'set -e; [ "`curl -sSf http://localhost:$PORT`" == "ok" ]'

ENTRYPOINT '/app/start.sh'
