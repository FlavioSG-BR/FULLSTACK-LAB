FROM node:15 as builder

WORKDIR /app

COPY package*.json ./

COPY . .

RUN npm run build

EXPOSE 3000


