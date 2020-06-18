when work on localhost, set host file `c:\windows\system32\drivers\etc\hosts` to: 

127.0.0.1 stromy-admin-app.mojacz.test
127.0.0.1 stromy-client-app.mojacz.test
127.0.0.1 stromy-api.mojacz.test


## Setting up new server
1. Add service to docker-compose.yml
   * networks proxy MUST belong to all networks in order to be able to proxying
2. Add subdomain 
   1. Add name of server (subdmain) in .env file as variable
   2. Add this variable in 
3. Create nginx .conf template in ./template folder or use default
   * add server, usually listening on 80
   * **don't** use `default_server`!!
   * as a `server_name` use env variable
   * on root location `/` use `proxy_pass http://example-service;` without any port, container will know where to send you
4. On localhost add domain to `c:\windows\system32\drivers\etc\hosts` so computer redirect it to `localhost` and thus to proxy. `127.0.0.1 example.mojacz.test`

```yml
    example-server:
      container_name: example-server
      build:
        dockerfile: Dockerfile
        context: ../example-server
      networks:
        - local
```

```
server {
    listen 80;
    server_name ${EXAMPLE_DOMAIN};

    location / {
      proxy_pass http://example-service;
    }
}
```