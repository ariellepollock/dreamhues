ARG PYTHON_VERSION=3.8-slim-bullseye

FROM python:${PYTHON_VERSION}

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# install psycopg2 dependencies.
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /code

WORKDIR /code

# install psycopg2 dependencies
RUN apt-get update && apt-get install -y \
    libpq-dev \
    gcc \
    && rm -rf /var/lib/apt/lists/*  # <-- Updated!

COPY requirements.txt /tmp/requirements.txt

COPY requirements.txt /tmp/requirements.txt
RUN set -ex && \
    pip install --upgrade pip && \
    pip install -r /tmp/requirements.txt && \
    rm -rf /root/.cache/
COPY . /code

ENV SECRET_KEY "vyYOZb3sRjh8Equ6NuyB7gWCG3vGNa8I3rBjB3NnzZbyofn3fi"
#  bring in below from env file:
ENV DATABASE_URL "postgresql://ariellepollock:i8EGjOxJ0zcN@ep-tiny-wind-a51hibae.us-east-2.aws.neon.tech/neondb?sslmode=require"

ENV ENV NEON_NAME "neondb"
ENV NEON_USER "ariellepollock"
ENV NEON_PASSWORD "i8EGjOxJ0zcN"
ENV NEON_HOST "ep-tiny-wind-a51hibae.us-east-2.aws.neon.tech"
ENV NEON_PORT "5432"

ENV AWS_ACCESS_KEY_ID "AKIAVRUVSYRWFZ2QI5O2"
ENV AWS_SECRET_ACCESS_KEY "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"
ENV S3_BASE_URL "https://s3.us-east-2.amazonaws.com/"
ENV S3_BUCKET "somni-photos-s3"
#  end of env imports

RUN python manage.py collectstatic --noinput

EXPOSE 8000

CMD ["gunicorn", "--bind", ":8000", "--workers", "2", "dreamhues.wsgi"]

