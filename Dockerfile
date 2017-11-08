FROM node:8
LABEL maintainer "David J. M. Karlsen <david@davidkarlsen.com>"
RUN wget -q -O - https://dl-ssl.google.com/linux/linux_signing_key.pub | apt-key add - && \
	sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list' && \
	apt-get update && \
	apt-get -y install google-chrome-stable && \
	apt-get clean && \
	rm -rf /var/cache/apt
