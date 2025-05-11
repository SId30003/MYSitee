FROM node:18 AS builder

WORKDIR /app

COPY package*.json ./

# Install ajv explicitly
RUN npm install ajv@latest --legacy-peer-deps

# Install other dependencies
RUN npm install --legacy-peer-deps

COPY . .

# Build the app
RUN npm run build

# Expose the port your app is running on (e.g., port 80 for a web app)
EXPOSE 80

# Command to start the app
CMD ["npm", "start"]
