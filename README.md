# TIOJ Docker #

## Introduction ##

This is a dockerized version of [TIOJ](https://tioj.infor.org/), it will clone the [adrien1018](https://github.com/adrien1018)'s latest [TIOJ repo](https://github.com/adrien1018/tioj) and [miku repo](https://github.com/oToToT/miku) to build a TIOJ.

## Notice ##

1. We uses a standalone [passenger](https://github.com/phusion/passenger) instead of nginx as default server.
2. miku is running in **privileged** mode of docker.

## Installation guide ##

1. clone this repo by doing `git clone https://github.com/oToToT/tioj-docker`.
2. configure `MYSQL_ROOT_PASSWORD`, `TOKEN`, and `KEY` in `.env` **carefully**.
3. run `docker-compose build` to build docker images.
4. run `docker-compose up -d` to enjoy TIOJ at port 7122.

To build in mode other than **production**, please change L12, L23, L25 in `docker-compose.yml`. 

## Judge Management & Other ##

Please refer to [https://github.com/adrien1018/tioj](https://github.com/adrien1018/tioj) or open an issue [here](https://github.com/oToToT/tioj-docker/issues) for more detail.

Also, Pull Request is welcomed.

## TODO ##

- [ ] Reduce image size by using alpine in miku
- [ ] Reduce image size by minimizing dependencies
- [ ] Run miku without privileged
- [ ] Make mode change more easily in tioj
