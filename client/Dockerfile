FROM node:12-alpine AS builder
WORKDIR /app
COPY package*.json /app/
RUN npm ci
COPY . .
RUN npm run build
RUN npm ci --production

FROM node:12-alpine
WORKDIR /app
RUN npm install pm2 -g
COPY --from=builder /app /app
RUN rm -r /app/src
CMD npm run start:production
EXPOSE 8080