#!/usr/bin/env sh

sudo docker compose exec sem_forms /etc/init.d/cron reload
echo "Cron restarted"
