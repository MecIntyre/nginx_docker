# Download NGINX
FROM nginx

# Copy the html-, conf- and rule-datas in the respective dirs
COPY html/ /usr/share/nginx/html/
COPY conf/ /etc/nginx/
COPY prometheus/ /etc/prometheus/rules/

# Portdefinition
EXPOSE 80
EXPOSE 443
CMD ["nginx","-g","daemon off;"]
