# FROM jenkins/jenkins:2.414.2-jdk11
# USER root
# RUN apt-get update && apt-get install -y lsb-release python3-pip
# RUN curl -fsSLo /usr/share/keyrings/docker-archive-keyring.asc \
#   https://download.docker.com/linux/debian/gpg
# RUN echo "deb [arch=$(dpkg --print-architecture) \
#   signed-by=/usr/share/keyrings/docker-archive-keyring.asc] \
#   https://download.docker.com/linux/debian \
#   $(lsb_release -cs) stable" > /etc/apt/sources.list.d/docker.list
# RUN apt-get update && apt-get install -y docker-ce-cli
# USER jenkins
# RUN jenkins-plugin-cli --plugins "blueocean:1.25.3 docker-workflow:1.28"

FROM jenkins/jenkins

# Switch to root to install packages and plugins
USER root

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

# Install Jenkins plugins
RUN jenkins-plugin-cli --plugins RUN jenkins-plugin-cli --plugins blueocean docker-workflow

# Switch back to Jenkins user
USER jenkins
