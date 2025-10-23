FROM verdaccio/verdaccio:latest

# Переключаемся на root пользователя
USER root

# Создаем директорию для данных
RUN mkdir -p /verdaccio/storage /verdaccio/plugins

# Копируем конфигурацию
COPY config.yaml /verdaccio/conf/config.yaml

# Устанавливаем права на все директории
RUN chown -R root:root /verdaccio/storage /verdaccio/plugins /verdaccio/conf

# Открываем порт
EXPOSE 4873

# Запускаем Verdaccio от root пользователя
CMD ["verdaccio", "--config", "/verdaccio/conf/config.yaml", "--listen", "0.0.0.0:4873"]
