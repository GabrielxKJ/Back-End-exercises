FROM node:14-alpine AS build

WORKDIR /app

COPY package*.json ./

RUN chown -R node:node /app
USER node
FROM nginx:1.16.0-alpine AS prod
COPY --from=build /app/build/ /usr/share/nginx/html 
EXPOSE 80

ENTRYPOINT [ "nginx", "-g", "daemon off;" ]