FROM 4teamwork/centos-buildenv

ENV RUBY_MAJOR 2.4
ENV RUBY_VERSION 2.4.5
ENV RUBY_DOWNLOAD_SHA256 6737741ae6ffa61174c8a3dcdd8ba92bc38827827ab1d7ea1ec78bc3cefc5198
ENV RUBYGEMS_VERSION 3.0.2
ENV BUNDLER_VERSION 2.0.1

RUN set -ex \
    && cd /usr/local/src \
    && curl -OL "https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR%-rc}/ruby-$RUBY_VERSION.tar.xz" \
    && tar xJf ruby-$RUBY_VERSION.tar.xz \
    && rm ruby-$RUBY_VERSION.tar.xz \
    && cd /usr/local/src/ruby-$RUBY_VERSION \
    && ./configure --disable-install-doc --enable-shared \
    && make -j "$(getconf _NPROCESSORS_ONLN)" \
    && make install \
    && cd /usr/local/src \
    && rm -rf ruby-$RUBY_VERSION \
    && gem update --system "$RUBYGEMS_VERSION" \
    && gem install bundler --force --no-document --version "$BUNDLER_VERSION"
