# app.py or wsgi.py以外ならFLASK_APPのexportが必須。
FROM python:3.10 as depencencies
ENV FLASK_APP=app

COPY ./requirements.txt /
RUN <<EOF
mkdir /usr/local/app
mv /requirements.txt .
pip install -r requirements.txt
rm requirements.txt
EOF

FROM depencencies AS app
WORKDIR /usr/local/app
COPY . .
EXPOSE 8000
