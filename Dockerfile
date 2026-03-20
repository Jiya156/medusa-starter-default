# Use Node.js 20 Alpine as base image
FROM node:20-alpine

# Install required system dependencies
RUN apk add --no-cache python3 make g++ 

# Set working directory
WORKDIR /server

# Copy package files
COPY package.json yarn.lock .yarnrc.yml ./

# Install dependencies
RUN yarn install

# Copy all source code
COPY . .

# Build the application
RUN yarn build

# Copy and run start script
COPY start.sh /server/start.sh
RUN chmod +x /server/start.sh

# Expose backend port
EXPOSE 9000

CMD ["/server/start.sh"]