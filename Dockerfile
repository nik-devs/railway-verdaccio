FROM verdaccio/verdaccio:latest

# Switch to root user
USER root

# Create data directories
RUN mkdir -p /verdaccio/storage /verdaccio/plugins

# Copy configuration
COPY config.yaml /verdaccio/conf/config.yaml

# Set permissions on all directories
RUN chown -R root:root /verdaccio/storage /verdaccio/plugins /verdaccio/conf

# Expose port
EXPOSE 4873

# Run Verdaccio as root user
CMD ["verdaccio", "--config", "/verdaccio/conf/config.yaml", "--listen", "0.0.0.0:4873"]
