FROM nginx
ARG BUILDARCH
COPY entrypoint.sh .
RUN chmod 755 /entrypoint.sh
CMD ["/bin/bash", "-c", "nginx; ./entrypoint.sh"]
