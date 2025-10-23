FROM verdaccio/verdaccio:latest

# Создаем директорию для данных
RUN mkdir -p /verdaccio/storage /verdaccio/plugins

# Копируем конфигурацию
COPY config.yaml /verdaccio/conf/config.yaml

# Устанавливаем права на директорию conf для записи htpasswd
RUN chown -R $VERDACCIO_USER_UID:root /verdaccio/conf

# Открываем порт
EXPOSE 4873

# Запускаем Verdaccio с отладочной информацией
CMD ["verdaccio", "--config", "/verdaccio/conf/config.yaml", "--listen", "0.0.0.0:4873"]
