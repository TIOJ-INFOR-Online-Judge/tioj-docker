FROM ruby:2.6.5
MAINTAINER oToToT

RUN apt-get update &&\
    apt-get install -y build-essential\
                       git\
                       imagemagick\
                       netcat

RUN git clone https://github.com/adrien1018/tioj /tioj
WORKDIR /tioj

RUN gem install rails -v 4.2.11 && bundle install

ARG MYSQL_ROOT_PASSWORD
ENV PASSWORD=$MYSQL_ROOT_PASSWORD

RUN echo "development:\n\
 adapter: mysql2\n\
 database: tioj_dev\n\
 host: database\n\
 username: root\n\
 password: $PASSWORD\n\
 encoding: utf8\n\
test:\n\
 adapter: mysql2\n\
 database: tioj_test\n\
 host: database\n\
 username: root\n\
 password: $PASSWORD\n\
 encoding: utf8\n\
production:\n\
 adapter: mysql2\n\
 database: tioj_production\n\
 host: database\n\
 username: root\n\
 password: $PASSWORD\n\
 encoding: utf8"\
> config/database.yml

ARG TOKEN
ENV TOKEN=$TOKEN
ARG KEY
ENV KEY=$KEY
RUN echo "Tioj::Application.config.secret_token = \"$TOKEN\"" > config/initializers/secret_token.rb &&\
    echo "Tioj::Application.config.fetch_key = \"$KEY\"" > config/initializers/fetch_key.rb

RUN mkdir public/announcement &&\
    echo -n '{"name":"","message":""}' > public/announcement/anno

RUN rake assets:precompile

COPY run_server.sh /tioj/run_server.sh
RUN chmod +x /tioj/run_server.sh

CMD /tioj/run_server.sh
