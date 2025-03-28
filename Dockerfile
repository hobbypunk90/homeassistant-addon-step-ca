# https://developers.home-assistant.io/docs/add-ons/configuration#add-on-dockerfile
ARG STEP_CA_VERSION
ARG BUILD_FROM

FROM smallstep/step-ca:${STEP_CA_VERSION} as builder
FROM $BUILD_FROM

COPY --from=builder /usr/local/bin/step /usr/local/bin/step
COPY --from=builder /usr/local/bin/step-ca /usr/local/bin/step-ca

# Copy root filesystem
COPY rootfs /
