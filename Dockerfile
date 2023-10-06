
# Use the official Keycloak image as a base image
# check the latest versions here: https://quay.io/repository/keycloak/keycloak?tab=tags
FROM quay.io/keycloak/keycloak:22.0.3 as builder

# Configure a database vendor
ENV KC_DB=postgres

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

WORKDIR /opt/keycloak

# for demonstration purposes only, please make sure to use proper certificates in production instead
RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -validity 1825 -dname "CN=server" -alias server -ext "SAN:c=DNS:idp.qriarlabs.cloud,IP:127.0.0.1" -keystore conf/server.keystore

# Copy the generated truststore.jks file to the container
COPY truststore.jks /opt/keycloak/truststore.jks

RUN /opt/keycloak/bin/kc.sh build

FROM quay.io/keycloak/keycloak:22.0.3

COPY --from=builder /opt/keycloak/ /opt/keycloak/

# Set environment variables for Keycloak
ENV KC_DB=postgres
ENV KC_DB_URL_HOST=postgres
ENV KC_DB_URL_DATABASE=db_name
ENV KC_DB_PASSWORD=password
ENV KC_DB_USERNAME=user_name
ENV KC_DB_SCHEMA=public
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin

# Copy your provider and theme files into the image
#COPY ./providers /opt/keycloak/providers
COPY ./themes /opt/keycloak/themes

# Expose the qiam port
EXPOSE 8080

ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

CMD ["start", "--proxy=edge", "--spi-truststore-file-file=/opt/keycloak/truststore.jks", "--spi-truststore-file-password=changeit", "--spi-truststore-file-hostname-verification-policy=WILDCARD", "--spi-theme-default=qiam","--spi-theme-welcome-theme=qiam","--spi-theme-login-theme=qiam","--spi-theme-account-theme=qiam","--spi-theme-admin-theme=qiam"]
