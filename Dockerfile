FROM ubuntu:18.04

RUN apt-get update -y \
  && apt-get install -y curl

RUN curl -sL https://deb.nodesource.com/setup_12.x | bash - \
  && curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add - \
  && echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list

RUN apt-get update -y
RUN apt-get install -y \
    openssh-server \
    curl \
    less \
    vim \
    nodejs \
    yarn \
    python3-pip \
    git


RUN mkdir -p /var/run/sshd \
  && echo 'root:root' |chpasswd \
  && sed -ri 's/^#?PermitRootLogin\s+.*/PermitRootLogin yes/' /etc/ssh/sshd_config \
  && sed -ri 's/UsePAM yes/#UsePAM yes/g' /etc/ssh/sshd_config \
  && mkdir -p /root/.ssh

RUN apt-get clean \
  && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*

RUN rm -f /usr/bin/python \
  && ln -s /usr/bin/python3.6 /usr/bin/python \
  && ln -s /usr/bin/pip3 /usr/bin/pip

COPY entrypoint.sh /usr/local/bin/

WORKDIR /data
EXPOSE 22

ENTRYPOINT ["entrypoint.sh"]
CMD tail -f /dev/null
