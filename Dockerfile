FROM node:16-alpine as builder
WORKDIR '/app'
COPY package.json .
RUN npm install
COPY . .
RUN npm run build
## add comments for git pull
## Date 28/Jan/2022 13:43

FROM nginx
COPY --from=builder /app/build /usr/share/nginx/html


