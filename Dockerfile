FROM node:lts-alpine as build
WORKDIR /usr/src/app
COPY package*.json ./
RUN npm install
COPY . .
EXPOSE 3000
CMD [ "node", "index.js" ]


FROM nginx
COPY ./nginx/nginx.conf /etc/nginx/nginx.conf 

COPY --from=build /app/build /usr/share/nginx/html 





