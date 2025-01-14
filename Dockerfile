# Use the official Ubuntu base image
FROM ubuntu:latest

# Create the app directory
WORKDIR /usr/src/app

# Set environment variables
ENV DEBIAN_FRONTEND=noninteractive

# Update and install dependencies
RUN apt-get update -y && \
    apt-get install -y curl && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

# Install Node.js 18.x
RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && \
    apt-get update -y && \
    apt-get install -y nodejs && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*

RUN addgroup -g 10014 choreo && \
    adduser  --disabled-password --uid 10014 --ingroup choreo choreouser

USER 10014

# Set the command to run the Node.js app
CMD ["sleep", "600"]  # Replace "app.js" with the entry point of your Node.js app



# FROM node:18-alpine

# WORKDIR /usr/src/app

# COPY package*.json ./

# RUN npm install

# COPY . .

# RUN addgroup -g 10014 choreo && \
#     adduser  --disabled-password --uid 10014 --ingroup choreo choreouser

# USER 10014

# RUN ls /home/
# RUN ls /home/choreouser

# ENTRYPOINT ["node", "index.js"]