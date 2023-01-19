FROM python:3.9

ENV VIRTUAL_ENV=/opt/venv

RUN python -m venv $VIRTUAL_ENV

ENV PATH="$VIRTUAL_ENV/bin:$PATH"

RUN pip install --no-cache psycopg2 boto3 mlflow

ENTRYPOINT ["mlflow"]