#react
FROM scratch as builder
ADD alpine-minirootfs-3.17.3-x86_64.tar.gz /
RUN apk add nodejs npm
RUN npx create-react-app react-deploy
WORKDIR /react-deploy
COPY App.js ./src
ARG VERSION
ENV REACT_APP_VERSION=${VERSION}
RUN npm install
RUN npm run build

#nginx
FROM nginx:latest
COPY --from=builder /react-deploy/build/. /var/www/html
COPY default.conf /etc/nginx/conf.d/default.conf
EXPOSE 80
HEALTHCHECK --interval=10s --timeout=1s \
  CMD curl -f http://localhost:80/ || exit 1
CMD ["nginx", "-g", "daemon off;"]