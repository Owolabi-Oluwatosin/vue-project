FROM node:lts-alpine

# Install simple http server for serving static content
RUN npm install -g http-server

# Make the 'app' folder the current working directory
WORKDIR /app

# Copy both 'package.json' and 'package-local.json' (if available)
COPY package*.json ./

# Install project dependencies
RUN npm install

# Copy project files and folders to the the current working directory (i.e. 'app' folder)
COPY . .

# Build app for production with minification
RUN npm run Build

EXPOSE 8081
CMD [ "http-server", "dist" ]