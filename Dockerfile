# Use the Keycloak base image
FROM quay.io/keycloak/keycloak:23.0.3

# Set environment variables
ENV KEYCLOAK_ADMIN=admin
ENV KEYCLOAK_ADMIN_PASSWORD=admin
ENV KC_HOSTNAME_STRICT_HTTPS="true"
ENV KC_HOSTNAME="keycloak-container.app.cloud.cbh.kth.se"
ENV KC_PROXY="edge"
ENV KC_HOSTNAME_ADMIN_URL="https://keycloak-container.app.cloud.cbh.kth.se"
  # keycloak-container.app.cloud.cbh.kth.se
# Enable health and metrics support
ENV KC_HEALTH_ENABLED=true
ENV KC_METRICS_ENABLED=true

# Configure a database vendor
ENV KC_DB=mysql
ENV KC_DB_URL=jdbc:mysql://vm.cloud.cbh.kth.se:2538/patientsystemdb
ENV KC_DB_USERNAME=root
# ENV KC_DB_PASSWORD=

# Expose port 8080
EXPOSE 8080

# Specify the entry point script
ENTRYPOINT ["/opt/keycloak/bin/kc.sh"]

# The default command to run Keycloak
CMD ["start-dev"]









