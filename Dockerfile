FROM node:16.13-alpine

RUN mkdir -p /opt/node; chown node:node /opt/node


# add `/app/node_modules/.bin` to $PATH
ENV PATH /opt/node/node_modules/.bin:$PATH

RUN npm install -g pnpm@next-7

USER node
WORKDIR /opt/node
RUN mkdir node_modules

COPY --chown=node:node package*.json ./
RUN ["pnpm", "install"]