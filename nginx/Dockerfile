FROM nginx:1.13

ARG DOMAIN_NAME
ENV DOLLAR '$'

#COPY dev-ssl /root/ssl

COPY nginx.conf /tmp/default.conf.template
COPY entrypoint.sh /entrypoint.sh

RUN cat /tmp/default.conf.template | envsubst '${DOMAIN_NAME},${DOLLAR}' | tee /etc/nginx/conf.d/default.conf

ENTRYPOINT ["/entrypoint.sh"]
CMD ["nginx", "-g", "daemon off;"]

