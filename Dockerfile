FROM rabbitmq:3-management
COPY *.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/rabbitmq_*.sh
CMD ["/usr/local/bin/rabbitmq_start.sh"]
