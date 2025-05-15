FROM jenkins/jenkins:2.452.1-jdk11

# Switch to root to install packages and plugins
USER root

# Match the GID of docker.sock (replace 999 with your actual docker group GID)
RUN groupadd -g 998 docker && usermod -aG docker jenkins

# Install Docker CLI
RUN apt-get update && apt-get install -y docker.io

# Install required tools
RUN apt-get update && apt-get install -y \
    lsb-release \
    python3-pip \
    curl \
    gnupg \
    apt-transport-https \
    ca-certificates

# Add Docker's official GPG key
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | \
    gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add Docker's stable repository
RUN echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
    https://download.docker.com/linux/debian $(lsb_release -cs) stable" > \
    /etc/apt/sources.list.d/docker.list

# Install Docker CLI
RUN apt-get update && apt-get install -y docker-ce-cli

# Install Jenkins plugins (corrected syntax)
RUN jenkins-plugin-cli --plugins blueocean docker-workflow

# Switch back to Jenkins user
USER jenkins
