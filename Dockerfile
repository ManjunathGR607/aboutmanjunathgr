FROM nginx

EXPOSE 80

COPY * /usr/share/nginx/html/
COPY images /usr/share/nginx/html/images
COPY css /usr/share/nginx/html/css
COPY js /usr/share/nginx/html/js
COPY lib /usr/share/nginx/html/lib
