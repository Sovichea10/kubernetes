FROM nginx:alpine

COPY ./service.sh /etc/service.sh

# Executable shell
RUN chmod +x /etc/service.sh

ENTRYPOINT [ "/etc/service.sh" ]