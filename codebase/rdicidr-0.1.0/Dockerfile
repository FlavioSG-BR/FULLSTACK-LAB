
FROM node:15.5.1 as builder

WORKDIR /app

COPY package*.json ./

COPY . .

CMD npm run build

EXPOSE 3000



