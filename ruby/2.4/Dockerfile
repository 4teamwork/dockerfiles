FROM 4teamwork/centos-buildenv

ENV RUBY_MAJOR 2.4
ENV RUBY_VERSION 2.4.1
ENV RUBY_DOWNLOAD_SHA256 4fc8a9992de3e90191de369270ea4b6c1b171b7941743614cc50822ddc1fe654
ENV RUBYGEMS_VERSION 2.6.12
ENV BUNDLER_VERSION 1.15.0

RUN set -ex \
    && cd /usr/local/src \
    && curl -OL "https://cache.ruby-lang.org/pub/ruby/${RUBY_MAJOR%-rc}/ruby-$RUBY_VERSION.tar.xz" \
    && tar xJf ruby-$RUBY_VERSION.tar.xz \
    && rm ruby-$RUBY_VERSION.tar.xz \
    && cd /usr/local/src/ruby-$RUBY_VERSION \
    && ./configure --disable-install-doc --enable-shared \
    && make \
    && make install \
    && cd /usr/local/src \
    && rm -rf ruby-$RUBY_VERSION \
    && gem update --system "$RUBYGEMS_VERSION" \
    && gem install bundler --no-document --version "$BUNDLER_VERSION"
