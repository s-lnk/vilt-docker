# vilt-docker
VILT framework Docker and Nginx reverse-proxy setup.
Vue3, Inertia and Laravel 11 with Vite and MySQL database.

## Description
Skeleton for dockering VILT production Docker image with reverse proxy Nginx.
Nginx reverse proxy should be configured with Certbot for SSL certificates (if needed).

## Setup Nginx
- Install nginx on Your Linux server
- Add configuration files for each subdomain in /etc/nginx/conf.d - see /nginx-reverse-proxy folder
- Start nginx reverse proxy `sudo systemctl start nginx`

## Setup Docker container
Current configuration is for locally built production files (npm run build).

- Create user in Your Linux server
- Upload built application. Check and set ownership to created user
- Use Docker configuration template from /docker folder for each of Your subdomains.
-- Ensure You have variables in Your .env file as shown in .env.example. Change values as needed.
-- Copy all data from /docker folder into root of Your project on server
-- You application will be protected with password. You can set it in .htpasswd under /docker/_docker/nginx/.htpasswd
-- Remove secutiry section from a.conf, if You don't need password for application
-- Edit php.ini configuration in /_docker/php/conf and enable required modules
- Execute docker-compose -f docker-compose.example.yml build
- Execute docker-compose -f docker-compose.example.yml up -d




