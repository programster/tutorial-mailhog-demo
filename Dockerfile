FROM ubuntu:22.04

RUN apt-get update && apt-get dist-upgrade -y

# Install php 8.1 from Ondrej PPA
RUN apt-get update && apt-get install -y software-properties-common apt-transport-https \
  && add-apt-repository ppa:ondrej/php -y \
  && apt-get update \
  && apt-get install php8.2-cli -y

# Install the relevant packages
RUN apt-get install -y curl git cron php8.2-curl php8.2-zip php8.2-mbstring

# Install composer 2
RUN apt-get update \
  && curl -sS https://getcomposer.org/installer | php \
  && mv composer.phar /usr/bin/composer \
  && chmod +x /usr/bin/composer

# Add our app to the container
COPY --chown=root:root ./app  /root/app

# Get composer to install packages.
RUN cd /root/app && ls /root/app && /usr/bin/composer install

# Set workdir to site folder for when people feel the need to enter the container and poke around.
WORKDIR /root/app

# Execute the containers startup script which will start many processes/services
# The startup file was already added when we added "project"
CMD ["php", "/root/app/main.php"]
