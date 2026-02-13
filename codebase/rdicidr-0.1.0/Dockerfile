
ARG NODE_VERSION=15

FROM node:${NODE_VERSION}-alpine as builder

WORKDIR /app

COPY package*.json ./

RUN npm install

COPY . .

RUN npm run build

CMD npm start

FROM nginx:alpine

COPY --from=builder /app/build /usr/share/nginx/html

ENTRYPOINT ["nginx", "-g", "daemon off;"]

EXPOSE 80



