# Docker Command Cheatsheet

A handy reference for common Docker commands.

---

## 🔹Containers

- **Run a container**

```bash
docker run <image>
docker run -it <image> /bin/bash   # interactive shell
docker run -d -p 8080:80 <image>   # detached, port mapping
```

* **List containers**

```bash
docker ps               # running containers
docker ps -a            # all containers (including stopped)
```

* **Manage containers**

```bash
docker stop <container_id>          # stop
docker start <container_id>         # start
docker restart <container_id>       # restart
docker rm <container_id>            # remove
docker rm -f <container_id>         # force remove
docker logs -f <container_id>       # view logs (follow)
docker exec -it <container_id> sh   # exec shell
```

## 🔹 Images

* **List images**

```bash
docker images
```

* **Build image**

```bash
docker build -t <name>:<tag> .
```

* **Remove image**

```bash
docker rmi <image_id>
docker image prune        # remove dangling images
```

* **Pull & push**

```bash
docker pull <image>
docker push <repo>/<image>:<tag>
```


## 🔹 Volumes & Files

* **List volumes**

```bash
docker volume ls
```

* **Create volume**

```bash
docker volume create <name>
```

* **Run with volume**

```bash
docker run -v <volume_name>:/path/in/container <image>
docker run -v $(pwd):/app <image>   # mount current dir
```

* **Copy files**

```bash
docker cp <container_id>:/path/file ./localpath
docker cp ./localfile <container_id>:/path
```

## 🔹 Networks

* **List networks**

```bash
docker network ls
```

* **Create network**

```bash
docker network create <name>
```

* **Run container in network**

```bash
docker run --network=<name> <image>
```


## 🔹 System & Cleanup

* **Show system info**

```bash
docker info
docker version
```

* **Resource usage**

```bash
docker stats
```

* **Cleanup**

```bash
docker system prune        # remove unused containers, networks, images
docker system prune -a     # remove EVERYTHING unused
```


## 🔹 Docker Compose

* **Start services**

```bash
docker compose up
docker compose up -d       # detached
```

* **Stop services**

```bash
docker compose down
```

* **Rebuild**

```bash
docker compose build
docker compose up --build
```

* **Logs**

```bash
docker compose logs -f
```


