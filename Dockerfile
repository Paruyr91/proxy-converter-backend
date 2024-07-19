# Use the official Node.js image.
# https://hub.docker.com/_/node
# Specify the platform if necessary
FROM node:18

# Install necessary libs for Puppeteer
RUN apt-get update \
 && apt-get install -y chromium \
    fonts-ipafont-gothic fonts-wqy-zenhei fonts-thai-tlwg fonts-kacst fonts-freefont-ttf libxss1 \
    --no-install-recommends
    


# Create and change to the app directory.
WORKDIR /usr/src/app

# Copy application dependency manifests to the container image.
COPY package*.json ./

# Setup nest CLI
RUN npm install -g @nestjs/cli


# Copy local code to the container image.
COPY . .

# install modules
RUN npm install

# Run the web service on container startup.
CMD [ "npm", "run",  "start:dev" ]

# Use port 5000 to match the app's default port.
EXPOSE 80