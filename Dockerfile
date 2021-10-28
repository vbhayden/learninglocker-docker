FROM node:10

RUN echo "Updating Packages" \
	&& apt-get update -y \
	&& apt-get upgrade -y \
	&& apt-get install -y --allow-unauthenticated --assume-yes \
		curl \
		git \
		python \
		build-essential \
		xvfb \
		apt-transport-https
		
RUN echo "Installing yarn" \
	&& npm install -g --force yarn
	

ADD locker /opt/learninglocker
WORKDIR /opt/learninglocker

COPY .env ./.env

RUN echo "Building Services" \
	&& rm yarn.lock \
	&& npm_config_build_from_source=true yarn install --ignore-engines \
	&& yarn build-all
	
#RUN echo "Fixing asset path" \
#	&& cp -r ui/dist/server ../public \
#	&& cp -r ui/dist/server public \
#	&& cp -r ui/dist/server ui/public \
#	&& cp -r ui/dist/server ui/dist/public


