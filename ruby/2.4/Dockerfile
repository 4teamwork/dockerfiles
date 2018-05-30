FROM 4teamwork/centos-buildenv

ENV RUBY_MAJOR 2.4
ENV RUBY_VERSION 2.4.4
ENV RUBY_DOWNLOAD_SHA256 1d0034071d675193ca769f64c91827e5f54cb3a7962316a41d5217c7bc6949f0
ENV RUBYGEMS_VERSION 2.7.7
ENV BUNDLER_VERSION 1.16.2

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
    && gem install bundler --force --no-document --version "$BUNDLER_VERSION"
