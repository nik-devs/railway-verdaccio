FROM verdaccio/verdaccio:latest

# Создаем директорию для данных
RUN mkdir -p /verdaccio/storage /verdaccio/plugins

# Копируем конфигурацию
COPY config.yaml /verdaccio/conf/config.yaml

# Устанавливаем права доступа только для существующих директорий
RUN chown -R $VERDACCIO_USER_UID:root /verdaccio/storage /verdaccio/plugins && \
    chown $VERDACCIO_USER_UID:root /verdaccio/conf/config.yaml

# Открываем порт
EXPOSE 4873

# Запускаем Verdaccio
CMD ["verdaccio"]
