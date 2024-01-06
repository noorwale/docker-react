FROM node:alpine as builder

WORKDIR '/app'

COPY package.json .

RUN npm install

COPY . .

RUN npm run build

## Once the build is complete, we shall get a build folder in /app/build

FROM nginx

## Copy from builder phase to nginx's /usr/share/nginx/html

COPY --from=builder /app/build /usr/share/nginx/html

## Once the nginx container starts, the start up command is going work automatically. 