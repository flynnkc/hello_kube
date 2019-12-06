# Start with python 3.7 lightweight image
FROM python:3.7-alpine

# Updates
RUN apk update && apk upgrade

# Working directory
WORKDIR /usr/src/app

# Prevent python from writing files to disc
ENV PYTHONDONTWRITEBYTECODE 1

# Prevent python from buffering
ENV PYTHONUNBUFFERED 1

# Get dependencies
COPY ./requirements.txt /usr/src/app/requirements.txt
RUN pip install --upgrade pip
RUN pip install -r requirements.txt

COPY hello_kube /usr/src/app/

EXPOSE 8000

CMD [ "python", "manage.py", "runserver", "0.0.0.0:8000" ]