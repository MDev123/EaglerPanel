FROM openjdk:17-jdk-slim

WORKDIR /app

# Install basic tools
RUN apt-get update && apt-get install -y curl bash

# Copy all repo files
COPY . .

# Make scripts executable
RUN chmod +x paper.sh waterfall.sh install.sh

# Install anything needed from install.sh
RUN ./install.sh || true

# Expose the Minecraft and proxy ports
EXPOSE 25565 25566

# Start both the server and proxy
CMD ./paper.sh & ./waterfall.sh & wait
