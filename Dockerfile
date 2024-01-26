# Builder stage
FROM quay.io/keycloak/keycloak:23.0.4 as builder

# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database vendor
ENV KC_DB=mysql

WORKDIR /opt/keycloak
# for demonstration purposes only, please make sure to use proper certificates in production instead
RUN keytool -genkeypair -storepass password -storetype PKCS12 -keyalg RSA -keysize 2048 -dname "CN=server" -alias server -ext "SAN:c=DNS:localhost,IP:127.0.0.1" -keystore conf/server.keystore

# Perform any build steps if needed
# RUN /opt/keycloak/bin/kc.sh build

# Second stage
FROM quay.io/keycloak/keycloak:latest

# COPY --from=builder /opt/keycloak/ /opt/keycloak/

# change these values to point to a running postgres instance
ENV KC_DB=mysql
ENV KC_DB_URL=jdbc:mysql://130.237.83.249:2538/patientsystemdb
ENV KC_DB_USERNAME=root
#ENV KC_DB_PASSWORD=<>
# DBPASSWORD
ENV KC_HOSTNAME=cloud.cbh.kth.se

#ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

# Set the entry point for development mode
# CMD ["/opt/keycloak/bin/kc.sh", "start-dev"]
# CMD /opt/keycloak/bin/kc.sh start-dev
CMD ["start-dev"]






