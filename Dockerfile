FROM registry.ocp4.example.com:8443/ubi8/ubi AS builder
RUN dnf install -y curl && dnf clean all
COPY ./script.sh /tmp/my-app-binary
#ARG BINARY_URL="http://workstation.lab.example.com/script.sh"
#RUN curl -Lo /tmp/my-app-binary ${BINARY_URL} && chmod +x /tmp/my-app-binary

FROM  registry.ocp4.example.com:8443/ubi8/ubi
WORKDIR /app
COPY --from=builder /tmp/my-app-binary /app/my-app-binary
USER 1001
CMD ["./my-app-binary"]
