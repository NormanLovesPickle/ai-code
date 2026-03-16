FROM node:18-alpine AS build
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build-only

FROM nginx:alpine
COPY --from=build /app/dist /usr/share/nginx/html
