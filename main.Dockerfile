FROM ubuntu:latest
RUN apt-get update && apt-get install -y sudo openssh-server vim git tmux sudo curl zsh
RUN apt-get install apt-transport-https ca-certificates curl software-properties-common -y
RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
RUN add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
RUN apt-cache policy docker-ce
RUN apt-get install docker.io -y
RUN useradd -m admin && echo "admin:admin" | chpasswd && adduser admin sudo
EXPOSE 22
COPY . $HOME/
COPY ./login_script.sh /etc/profile.d/
RUN service ssh start
CMD ["/usr/sbin/sshd", "-D"]
