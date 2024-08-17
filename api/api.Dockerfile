# syntax=docker/dockerfile:1

FROM node:20 AS build

WORKDIR /usr/src/app

# Install app dependencies
COPY package*.json ./
RUN npm install
# If you are building your code for production
#RUN npm ci --only=production

# Bundle app source
COPY . .
RUN npm run build

# This will use a minimal base image for the runtime
FROM node:20.13.0-alpine

WORKDIR /usr/src/app

EXPOSE 8080

# Copy results from previous stage
COPY --from=build /usr/src/app/package*.json ./
RUN npm ci --production
COPY --from=build /usr/src/app/dist ./dist

RUN npm prune --production

CMD [ "node", "dist/index.js" ]