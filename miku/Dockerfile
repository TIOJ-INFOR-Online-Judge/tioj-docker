FROM ubuntu:20.04
MAINTAINER oToToT

# use gcc 9 as default
RUN apt-get update &&\
    apt-get install -y libcap-dev libcurl4-openssl-dev make g++-9 ghc git openssl python python3 python3.7 &&\
    update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-9 60 \
    --slave /usr/bin/g++ g++ /usr/bin/g++-9 \
    --slave /usr/bin/gcc-nm gcc-nm /usr/bin/gcc-nm-9 \
    --slave /usr/bin/gcc-ar gcc-ar /usr/bin/gcc-ar-9 \
    --slave /usr/bin/gcc-ranlib gcc-ranlib /usr/bin/gcc-ranlib-9

RUN git clone https://github.com/TIOJ-INFOR-Online-Judge/miku /miku
WORKDIR /miku
RUN git submodule update --init

ARG KEY
ENV KEY=$KEY
RUN echo "tioj_url, tioj_key = 'http://tioj:4000', '$KEY'" > app/tioj_url.py
RUN make

ENV PATH="/miku/app:/miku/bin:/miku:${PATH}"
CMD ["/miku/bin/miku", "--parallel", "2", "-b", "100", "--verbose", "--aggressive-update"]
