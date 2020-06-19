# Build Phase

FROM node:alpine

WORKDIR '/app'

COPY package.json .
RUN npm install

COPY . .
RUN npm run build

# /app/build will have build files

# Run Phase using nginx server
FROM nginx
EXPOSE 80
COPY --from=0 /app/build /usr/share/ngnix/html