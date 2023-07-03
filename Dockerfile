FROM nginx:alpine

# Create a non-root user and set permissions
RUN adduser -D -u 1000 aidana && \
    chown -R aidana:aidana /var/cache/nginx && \
    chown -R aidana:aidana /var/run && \
    chown -R aidana:aidana /var/log/nginx

# Create the /var/run/nginx.pid file
RUN touch /var/run/nginx.pid && \
    chown aidana:aidana /var/run/nginx.pid

# Switch to the non-root user
USER aidana

# Copy the website files to the appropriate directory
COPY ./src/ /usr/share/nginx/html/

# Start the Nginx server
CMD ["nginx", "-g", "daemon off;"]
