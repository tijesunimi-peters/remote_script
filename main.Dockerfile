FROM ubuntu:latest
RUN apt-get update && apt-get install -y sudo openssh-server vim git tmux sudo curl zsh ca-certificates curl gnupg lsb-release
RUN mkdir -p /etc/apt/keyrings
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
RUN echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get install -y docker-ce docker-ce-cli containerd.io docker-compose-plugin
RUN useradd -m admin && echo "admin:admin" | chpasswd && adduser admin sudo
RUN echo "root:admin" | chpasswd
EXPOSE 22 3050 3000 3001 8081 5000 5001 5555 27017 6379
COPY . $HOME/
COPY ./login_script.sh /etc/profile.d/
COPY ./sshd_config.conf /etc/ssh/sshd_config.d/
RUN service ssh start
CMD ["/usr/sbin/sshd", "-D"]
