FROM node:9.4.0-stretch
LABEL maintainer "David J. M. Karlsen <david@davidkarlsen.com>"
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
	apt-get update && \
	apt-get -y install google-chrome-stable vim less psmisc && \
	apt-get clean && \
	rm -rf /var/cache/apt && \
	arch="$(dpkg --print-architecture | awk -F- '{ print $NF }')" && \
	wget -O /usr/local/bin/gosu "https://github.com/tianon/gosu/releases/download/1.10/gosu-$arch" && \
	chmod a+x /usr/local/bin/gosu && \
	wget -q -O - "https://download.mozilla.org/?product=firefox-latest-ssl&os=linux64" |tar xjv -C /opt && \
	yarn global add @angular/cli sonarqube-scanner@latest retire && \
	ng set --global packageManager=yarn

COPY showversions.sh /
RUN /showversions.sh

ENV PROXY=http://proxy.evry.com:8080 \
	proxy=http://proxy.evry.com:8080 \
	HTTPS_PROXY=http://proxy.evry.com:8080 \
	https_proxy=http://proxy.evry.com:8080 \
	NO_PROXY=localhost,.evry.com,.finods.com,.localdomain,.cosng.net \
	NPM_REGISTRY=https://fsnexus.evry.com/nexus/repository/npm-all/ \
	CHROME_BIN=/usr/bin/google-chrome \
	NPM_CONFIG_PREFIX=/home/node/.npm-global \
	PATH=/opt/firefox:${PATH} \
	GOSU_USER=0:0 \
	GOSU_CHOWN=/home/node

RUN	npm set registry ${NPM_REGISTRY} && \
	yarn config set registry ${NPM_REGISTRY}

COPY gosu-entrypoint.sh /
RUN chmod +x /gosu-entrypoint.sh
ENTRYPOINT ["/gosu-entrypoint.sh"]
