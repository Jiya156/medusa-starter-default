FROM node:20-alpine

# Install system dependencies
RUN apk add --no-cache python3 make g++

# Set working directory
WORKDIR /server

# Copy package files
COPY package.json yarn.lock ./

# Create .yarnrc.yml to use node-modules linker
RUN echo "nodeLinker: node-modules" > .yarnrc.yml

# Install dependencies using built-in yarn
RUN yarn install --ignore-engines

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