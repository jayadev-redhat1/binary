FROM registry.ocp4.example.com:8443/ubi8/ubi AS Builder
RUN dnf install -y curl && dnf clean all
ARG BINARY_URL="http://workstation.lab.example.com/script-bin"
RUN curl -Lo /tmp/my-app-binary ${BINARY_URL} && chmod +x /tmp/my-app-binary

FROM  registry.ocp4.example.com:8443/ubi8/ubi
WORKDIR /app
COPY --from=builder /tmp/my-app-binary /app/my-app-binary
USER 1001
CMD ["./my-app-binary"]
