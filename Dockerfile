FROM alpine

COPY add-pkgs /root/add-pkgs
RUN /root/add-pkgs

WORKDIR /app
VOLUME /app

CMD ["/bin/bash"]
