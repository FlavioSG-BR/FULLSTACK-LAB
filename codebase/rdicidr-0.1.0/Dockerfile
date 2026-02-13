
ARG NODE_VERSION=15

FROM node:${NODE_VERSION} as builder

WORKDIR /app

COPY package*.json .

RUN npm run build

COPY . .

CMD npm start

FROM nginx:alpine

COPY --from=build /app/build /usr/share/nginx/html

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]


