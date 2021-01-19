FROM rabbitmq:3.8.9-alpine

# Define environment variables.
ENV RABBITMQ_DEFAULT_USER user
ENV RABBITMQ_DEFAULT_PASS password

ADD init.sh /init.sh

RUN ["chmod", "+x", "/init.sh"]

EXPOSE 15672

# Define default command
CMD ["/init.sh"]