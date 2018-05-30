FROM 4teamwork/ruby:2.4.4

COPY el-passenger.repo /etc/yum.repos.d/passenger.repo
RUN set -ex \
    && yum install -y nginx passenger \\
    && yum clean all

COPY passenger.conf /etc/nginx/conf.d/passenger.conf

EXPOSE 80

STOPSIGNAL SIGQUIT

CMD ["nginx", "-g", "daemon off;"]
