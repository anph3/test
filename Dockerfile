FROM python:3.9.5-slim-buster

RUN pip install --upgrade pip
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
       default-libmysqlclient-dev gcc pkg-config uvicorn\
    && rm -rf /var/lib/apt/lists/*

WORKDIR /usr/src/app
ENV PYTHONPATH "${PYTHONPATH}:/usr/src/app"
ENV PYTHONDONTWRITEBYTECODE=1
ENV PYTHONUNBUFFERED=1

COPY requirements.txt /usr/src/app/
RUN pip install --no-cache-dir -r requirements.txt
RUN pip install openpyxl

COPY . /usr/src/app

EXPOSE 80
CMD ["python", "main.py"]
