FROM ubuntu:bionic

RUN apt update
RUN apt upgrade -y

RUN apt install software-properties-common -y
RUN add-apt-repository ppa:deadsnakes/ppa
RUN apt install python3.7 -y

RUN apt install python3-pip -y
RUN python3 -m pip install --upgrade pip

COPY . /simpleApp

WORKDIR /simpleApp

EXPOSE 8000

RUN pip3 install -r requirements.txt
RUN python3 manage.py makemigrations
RUN python3 manage.py migrate

CMD ["python3.6", "manage.py", "runserver", "0.0.0.0:8000"]
