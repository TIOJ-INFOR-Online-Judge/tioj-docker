FROM ubuntu:18.04
MAINTAINER oToToT

# use gcc 8 as default
RUN apt-get update &&\
    apt-get install -y curl g++-8 ghc git libcap-dev make openssl python python3 python3.7 &&\
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-8 60 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-8 \
    --slave /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-8 \
    --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-8 \
    --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-8

RUN git clone https://github.com/adrien1018/miku /miku
WORKDIR /miku
RUN git submodule update --init

ARG KEY
ENV KEY=$KEY
RUN echo "tioj_url, tioj_key = 'http://tioj:4000', '$KEY'" > app/tioj_url.py
RUN make

ENV PATH="/miku/app:/miku/bin:/miku:${PATH}"
CMD ["/miku/bin/miku", "--parallel", "2", "-b", "100", "--verbose", "--aggressive-update"]
