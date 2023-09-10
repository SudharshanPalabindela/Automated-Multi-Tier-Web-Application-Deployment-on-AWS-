# Use an official Node.js runtime as the base image
FROM node:14

# Set the working directory in the container
WORKDIR /app

# Copy package.json and package-lock.json to the working directory
COPY package*.json ./

# Install application dependencies
RUN npm install

# Copy the application source code into the container
COPY . .

# Expose the port that the backend server will run on (e.g., 8080)
EXPOSE 8080

# Define the command to start the backend server
CMD ["node", "server.js"]
