# Download NGINX and Prometheus-Image
FROM nginx
FROM prometheus

# Copy the html-, conf- and rule-datas in the respective dirs
COPY html /usr/share/nginx/html
COPY conf /etc/nginx/.
COPY prometheus /etc/prometheus/rules/*.yml
