FROM ubuntu:22.04
ARG DEBIAN_FRONTEND=noninteractive

# Install the nescesarry packages
RUN apt update -y ; apt upgrade -y ; apt install -y xrdp fluxbox xterm vim openssh-server wget curl cabextract tzdata
RUN wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
RUN apt install -y ./google-chrome-stable_current_amd64.deb
RUN sed -i '/Google Chrome/c [exec] (Google Chrome) {/opt/google/chrome/google-chrome --no-sandbox} </opt/google/chrome/product_logo_32.xpm>' /etc/X11/fluxbox/fluxbox-menu

# Prepare the files
COPY run.sh /.run.sh
RUN chmod +x /.run.sh

# Finaly. run the server!
ENTRYPOINT /.run.sh
