FROM jenkins/jenkins:2.452.1-jdk11

# Switch to root to install packages and set up Docker access
USER root

# --- 🔧 Set up docker group matching host's docker.sock GID ---
# ⚠️ Replace 998 with actual GID from: `ls -n /var/run/docker.sock` on host
RUN groupadd -g 998 docker && usermod -aG docker jenkins

# --- 🐳 Install Docker CLI ---
RUN apt-get update && apt-get install -y docker.io

# --- 📦 Install required tools ---
RUN apt-get update && apt-get install -y \
    lsb-release \
    python3-pip \
    curl \
    gnupg \
    apt-transport-https \
    ca-certificates

# --- 🔐 Add Docker's official GPG key & repo ---
RUN curl -fsSL https://download.docker.com/linux/debian/gpg | \
    gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
    echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
    https://download.docker.com/linux/debian $(lsb_release -cs) stable" > \
    /etc/apt/sources.list.d/docker.list

# --- 🐳 Optional: Install docker-ce-cli (if you prefer over docker.io) ---
# RUN apt-get update && apt-get install -y docker-ce-cli

# --- 🔌 Install Jenkins plugins ---
RUN jenkins-plugin-cli --plugins blueocean docker-workflow

# Switch back to Jenkins user
USER jenkins
