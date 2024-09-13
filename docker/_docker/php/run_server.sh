#!/bin/bash


composer install

php artisan key:generate
php artisan migrate:refresh --seed
php artisan optimize
php artisan config:clear
php artisan storage:link
php artisan route:cache
#php artisan queue:work redis &
#php artisan schedule:work &
php-fpm
