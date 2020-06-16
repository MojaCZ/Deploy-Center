FROM nginx:alpine

COPY ./default.conf /etc/nginx/conf.d/default.conf
# COPY ./nginx.conf /etc/nginx/nginx.conf

RUN rm -rf /usr/share/nginx/html/*

# COPY ./default.conf /etc/nginx/conf.d/
CMD ["nginx", "-g", "daemon off;"]