FROM openjdk:17-jdk-slim

# Install wget, curl, bash (needed by your scripts)
RUN apt-get update && apt-get install -y wget curl bash unzip

# Copy everything
COPY . .

# Make scripts executable
RUN chmod +x install.sh paper.sh waterfall.sh

# Run install.sh (now without sudo errors)
RUN ./install.sh

EXPOSE 25565 25566

CMD ./paper.sh & ./waterfall.sh & wait
