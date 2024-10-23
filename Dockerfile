# Dockerfile
# Use an official Node.js runtime as a parent image (ARM64 variant for M1)
FROM node:14-alpine

# Set the working directory inside the container
WORKDIR /usr/src/app

# Copy package.json and package-lock.json
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the rest of the application code
COPY . .

# Expose port 3000
EXPOSE 3000

# Define the command to run the app
CMD ["node", "app.js"]
