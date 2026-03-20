FROM node:20-alpine

# Install system dependencies
RUN apk add --no-cache python3 make g++

# Set working directory
WORKDIR /server

# Copy package files
COPY package.json yarn.lock ./

# Install dependencies with classic yarn
RUN npm install -g yarn && yarn install

# Copy all source code
COPY . .

# Build the application
RUN yarn build

# Copy start script
COPY start.sh /server/start.sh
RUN chmod +x /server/start.sh

# Expose backend port
EXPOSE 9000

CMD ["/server/start.sh"]