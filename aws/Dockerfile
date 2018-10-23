FROM python:3.6

RUN apt-get update && \
    apt-get install groff-base && \
    rm -Rf /var/lib/apt/lists/*
     
RUN pip install awscli --upgrade

ENTRYPOINT [ "aws" ]
CMD [ "help" ]