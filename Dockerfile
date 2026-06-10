FROM registry.ocp4.example.com:8443/ubi8/ubi
RUN dnf install -y httpd wget
ARG BINARY_URL="http://workstation.lab.example.com/script-bin"
WORKDIR /app
RUN wget $BINARY_URL 
RUN mv script-bin script 
RUN chmod +x script
CMD ["/bin/bash","/app/script"]

