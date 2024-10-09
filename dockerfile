FROM node:18.20.4 AS base

WORKDIR /app
COPY package.json ./
RUN npm install
COPY . .

FROM node:18-alpine
WORKDIR /usr/src/app
COPY --from=base /app .
EXPOSE 3000
CMD ["node","app.js"]
