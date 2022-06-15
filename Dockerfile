FROM ubuntu

RUN apt-get update &&\
    apt-get install -y python3 &&\
    apt-get install -y python3-pip &&\
    apt-get install -y git &&\
    apt-get install -y libpq-dev &&\
    apt-get install -y python3-dev &&\
    pip install --upgrade "knowledge-repo[all]" psycopg2 &&\
    git clone --branch master https://github.com/DanielSastoque/knowledge_repo_test.git

ENV KNOWLEDGE_REPO=git:///knowledge_repo_test/ \
    SERVER_NAME=localhost:7001 \
    DB_URI=postgresql://knowledge_repo:knowledge_repo@host.docker.internal:5433/knowledge_repo

CMD cd knowledge_repo_test &&\
    knowledge_repo --repo $KNOWLEDGE_REPO runserver --config config.py --port 7001
