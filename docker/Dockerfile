FROM alpine:3.5
MAINTAINER Davor Serfez <dserfez@gmail.com>
RUN apk update \
  && apk upgrade \
  && apk add --no-cache \
        ca-certificates \
	ruby ruby-json ruby-io-console ruby-rake ruby-bigdecimal \
  && apk add --no-cache --virtual .build-deps \
        sudo build-base ruby-dev linux-headers \
  && gem install --no-ri --no-rdoc unicorn sinatra bundler tilt \
  && apk del .build-deps \
  && rm -rf /var/cache/apk/* /tmp/* /var/tmp/* /usr/lib/ruby/gems/*/cache/*.gem

WORKDIR /opt/app

CMD ["unicorn", "-c", "unicorn"]
