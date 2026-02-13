
ARG NODE_VERSION=15

FROM node:${NODE_VERSION} as builder

WORKDIR /app

COPY package*.json .

RUN npm install

COPY . .

RUN npm run build

FROM nginx:alpine

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


