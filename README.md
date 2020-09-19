# A Docker based Home Assistant interface for the EPEver MPPT Charge controllers to interface from Modbus to MQTT

**Docker Hub:** [`bushrangers/ha-epever-mqtt:latest`](https://hub.docker.com/r/bushrangers/ha-epever-mqtt/)


![License](https://img.shields.io/github/license/ned-kelly/docker-epever-homeassistant.svg) ![Docker Pulls](https://img.shields.io/docker/pulls/bushrangers/ha-epever-mqtt.png) ![buildx](https://github.com/ned-kelly/docker-epever-homeassistant/workflows/buildx/badge.svg)

----

This project is a lightweight docker container, designed to read data from the EPEver MPPT charge controllers, then transmit the data to a [Home Assistant](https://www.home-assistant.io/) server (via MQTT) as part of a wider energy monitoring solution for your solar...

As I'm short on time, the code is based on the [PhpEpsolarTracer](https://github.com/toggio/PhpEpsolarTracer) by Luca Soltoggio.

This is a great addition to the [Voltronic HA Solar Monitor](https://github.com/ned-kelly/docker-voltronic-homeassistant) (if you are running this also) and using both the Epever MPPT and the Voltronic Inverter in parallel.

--------------------------------------------------

The program is designed to be run in a Docker Container, and can be deployed on a Raspberry PI, inside your breaker box, using a DIN rail mount such as the [Modulbox, from Italtronic](https://au.rs-online.com/web/p/raspberry-pi-cases/7989818/).

## Prerequisites

- Docker
- Docker-compose
- Modbus connection to the MPPT (Such as the Exar Corp Modbus USB cable that comes with the MPPT controller)
- Home Assistant [running with a MQTT Server](https://www.home-assistant.io/components/mqtt/)


## Configuration & Standing Up

It's pretty straightforward, just clone down the sources, set the configuration in the `config/` directory, and then stand the container up...

```bash
# Clone down sources on the host you want to monitor...
git clone https://github.com/ned-kelly/docker-epever-homeassistant.git /opt/docker-epever-homeassistant
cd /opt/docker-epever-homeassistant

# Configure your MQTT server settings, offsets, serial port, etc...
vi config/config.yml

```

Note read the following thread (the whole thread) if you're having issues getting your Exar Modbus adapter working: https://www.raspberrypi.org/forums/viewtopic.php?t=171225


```bash
docker-compose up -d

```

_**Note:**_

  - builds on docker hub are currently for `linux/amd64,linux/arm/v6,linux/arm/v7,linux/arm64,linux/386` -- If you have issues standing up the image on your Linux distribution (i.e. An old Pi/ARM device) you may need to manually build the image to support your local device architecture - This can be done by uncommenting the build flag in your docker-compose.yml file.

  - The default `docker-compose.yml` file includes Watchtower, which can be  configured to auto-update this image when we push new changes to github - Please **uncomment if you wish to auto-update to the latest builds of this project**.

## Integrating into Home Assistant.

Providing you have setup [MQTT](https://www.home-assistant.io/components/mqtt/) with Home Assistant, the device will automatically register in your Home Assistant when the container starts for the first time -- You do not need to manually define any sensors.

From here you can setup [Graphs](https://www.home-assistant.io/lovelace/history-graph/) and regular text value sensors to display sensor data.
