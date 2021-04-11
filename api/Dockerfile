FROM node:12-alpine AS builder
WORKDIR /api
COPY package*.json /api/
RUN npm ci
COPY tsconfig* /api/
COPY src /api/src
RUN npm run build
RUN npm ci --production

FROM node:12-alpine
WORKDIR /api
RUN npm install pm2 -g
COPY --from=builder /api /api
RUN rm -r /api/src
ADD https://github.com/ufoscout/docker-compose-wait/releases/download/2.2.1/wait /wait
RUN chmod +x /wait
CMD npm run start:production