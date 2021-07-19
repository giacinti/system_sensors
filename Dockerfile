FROM python:latest

VOLUME /etc/config/system_sensors
RUN apt-get update && \
    apt-get install -y python3-apt

COPY requirements.txt /usr/local/system_sensors/
RUN pip3 install -r /usr/local/system_sensors/requirements.txt

COPY src/*.py /usr/local/system_sensors/

CMD [ "python3","/usr/local/system_sensors/system_sensors.py","/etc/config/system_sensors/settings.yaml" ]

