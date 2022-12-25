
FROM node:16-bullseye-slim as builder

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /usr/src/app
RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update
RUN apt-get install gcc g++ make cmake python3 python3-pip ffmpeg -y

COPY package.json package-lock.json ./

ENV http_proxy http://192.168.31.111:7890
ENV https_proxy http://192.168.31.111:7890

RUN npm ci
RUN npm rebuild @tensorflow/tfjs-node --build-from-source

COPY . .


FROM builder as prod

ENV http_proxy http://192.168.31.111:7890
ENV https_proxy http://192.168.31.111:7890

RUN npm run build

RUN npm prune --omit=dev


FROM node:16-bullseye-slim

ARG DEBIAN_FRONTEND=noninteractive

WORKDIR /usr/src/app

RUN sed -i 's/deb.debian.org/mirrors.ustc.edu.cn/g' /etc/apt/sources.list
RUN apt-get update \
  && apt-get install -y ffmpeg \
  && rm -rf /var/cache/apt/lists

COPY --from=prod /usr/src/app/node_modules ./node_modules
COPY --from=prod /usr/src/app/dist ./dist

COPY package.json package-lock.json ./
COPY entrypoint.sh ./

# CMD [ "node", "dist/main" ]
