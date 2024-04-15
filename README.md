# README

# Technical Test - Frogmi
1. Instalar dependencias ```bundle install``` y ```yarn install```
2. Crear db ```rails db:create```
3. Ejecutar migraciones ```rails db:migrate```
4. Ejecutar task ```rails feature:fetch_and_insert_data```
5. Para ejecutar en modo desarrollo ```bin/dev```

6. Este proyecto tiene react integrado, donde podras visualizar la lista de terremotos que extraiga la task http://127.0.0.1:3000 (Ejecutandolo localmente)
7. Este proyecto cuenta con test ```rails test```

## Endpoints

curl -X GET \
'127.0.0.1:3000/api/features?page=1&per_page=10' \
-H 'Content-Type: application/vnd.api+json' \
-H 'cache-control: no-cache'

- Tambien posee el filtro por mag_type

curl -X GET \
'127.0.0.1:3000/api/features?page=1&per_page=10&mag_type=md,ml' \
-H 'Content-Type: application/vnd.api+json' \
-H 'cache-control: no-cache'

curl --request POST \
--url 127.0.0.1:3000/api/comments \
--header 'content-type: application/json' \
--data '{"body": "This is a comment", "feature_id": 1 }'

- Endpoint para obtener comentarios por feature (earthquake)

curl -X GET \
'127.0.0.1:3000/api/comments?feature_id=1' \
-H 'Content-Type: application/vnd.api+json' \
-H 'cache-control: no-cache'