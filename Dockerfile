FROM openjdk:17-jdk-slim

# Install curl, bash, and SDKMAN for Java management
RUN apt-get update && apt-get install -y curl bash unzip

# Install sdkman dependencies
RUN apt-get install -y zip

# Copy all files to /
COPY . .

# Make your scripts executable
RUN chmod +x install.sh paper.sh waterfall.sh

# Run install.sh to set up environment & install Java 17 (via sdkman)
RUN ./install.sh

# Expose Minecraft (25565) and proxy (25566) ports
EXPOSE 25565 25566

# Run both paper and waterfall servers together
CMD ./paper.sh & ./waterfall.sh & wait
