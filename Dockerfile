FROM python:3.4-alpine as base
RUN mkdir /code
ADD requirements.txt /code
WORKDIR /code
RUN pip install -r requirements.txt

FROM base
ADD . /code
CMD ["python", "app.py"]
