# Dockerfile
# Use a small, official Nginx image
FROM nginx:alpine

# Remove default nginx content and copy our html to the nginx html folder
COPY index.html /usr/share/nginx/html/index.html

# Expose port 80 inside the container (docs / clarity; optional)
EXPOSE 80

# Default command (inherited from nginx image) serves files with nginx