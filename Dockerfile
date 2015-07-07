FROM ubuntu:14.04

# Run some system updates and install apache
RUN sudo apt-get update
RUN sudo apt-get install -y apache2

# Add chrishargis.com Apache config
ADD docker_components/chrishargis.com.conf /etc/apache2/sites-available/chrishargis.com.conf
RUN ln -s /etc/apache2/sites-available/chrishargis.com.conf /etc/apache2/sites-enabled/chrishargis.com.conf

# Create directory for apache2 lock file and run directory
RUN mkdir -p /var/lock/apache2 /var/run/apache2

# et required environment variables
ENV APACHE_RUN_USER www-data
ENV APACHE_RUN_GROUP www-data
ENV APACHE_PID_FILE /var/run/apache2.pid
ENV APACHE_RUN_DIR /var/run/apache2
ENV APACHE_LOCK_DIR /var/lock/apache2
ENV APACHE_LOG_DIR /var/log/apache2
ENV LANG C

# Start Apache
CMD ["apachectl", "-DFOREGROUND"]

EXPOSE 80