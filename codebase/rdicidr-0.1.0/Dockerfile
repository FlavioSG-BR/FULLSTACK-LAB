

ARG NODE_VERSION=15

FROM node:${NODE_VERSION}-alpine as builder

WORKDIR /app

COPY package*.json ./

COPY . .

RUN npm run build

RUN npm start

FROM nginx:alpine

COPY --from=builder /app/build /src/shared/nginx/html

EXPOSE 80

ENTRYPOINT ["nginx", "-g", "daemon off;"]





