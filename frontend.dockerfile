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

# Build the frontend application
RUN npm run build

# Expose the port that the application will run on (e.g., 3000)
EXPOSE 3000

# Define the command to start the application
CMD ["npm", "start"]
