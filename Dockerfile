FROM nginx:alpine

# Static assets
COPY index.html /usr/share/nginx/html/index.html
COPY assets/ /usr/share/nginx/html/assets/

# Nginx config (no auth — Basic-Auth lives at Traefik layer in Coolify)
COPY nginx.conf /etc/nginx/conf.d/default.conf

EXPOSE 80

# Healthcheck managed by Coolify — keep image clean
