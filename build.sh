#!/bin/bash

echo "Остановка и удаление старых контейнеров..."
docker-compose down

echo "Сборка Docker-образа..."
docker-compose build

echo "Запуск контейнера..."
docker-compose up -d

echo "Контейнер запущен. Логи контейнера:"
docker-compose logs -f