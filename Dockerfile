FROM python:3.8-buster

WORKDIR /install

RUN apt-get update && apt-get install libpq-dev

COPY requirements.txt /tmp/requirements.txt

RUN python -m pip install -U pip setuptools
RUN pip install --no-cache-dir -r /tmp/requirements.txt

WORKDIR /app

COPY . .

CMD ["python", "-m", "binance_trade_bot"]
