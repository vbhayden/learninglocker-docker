FROM nginx:1.13

ARG DOMAIN_NAME

# Move our configuration into place
#
COPY nginx.conf /etc/nginx/nginx.conf
COPY proxy_headers.conf /etc/nginx/proxy_headers.conf

# Swap our environment variables
#
RUN cat /etc/nginx/nginx.conf | envsubst '$DOMAIN_NAME' | tee /tmp/nginx.conf
RUN mv /tmp/nginx.conf /etc/nginx/nginx.conf

