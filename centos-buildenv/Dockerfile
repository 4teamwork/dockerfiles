FROM centos:7
MAINTAINER Thomas Buchberger "t.buchberger@4teamwork.ch"
ENV REFRESHED_AT 2019-01-31

RUN yum -y install epel-release

RUN yum -y update && yum -y groupinstall development && yum -y install \
    bzip2-devel \
    cyrus-sasl-devel \
    freetype-devel \
    gdbm-devel \
    geos-devel \
    glibc-devel \
    lcms2-devel \
    libdb4-devel \
    libffi-devel \
    libgcc \
    libjpeg-turbo-devel \
    libstdc++-devel \
    libtiff-devel \
    libwebp-devel \
    libxml2-devel \
    libxslt-devel \
    mariadb-devel \
    ncurses-devel \
    openldap-devel \
    openssl-devel \
    readline-devel \
    sqlite-devel \
    zlib-devel \
    && yum clean all
