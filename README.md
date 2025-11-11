# Docker Hello World — Nginx Static Site

[![License](https://img.shields.io/badge/license-MIT-blue.svg)](LICENSE)
[![Docker Image Size](https://img.shields.io/docker/image-size/chan2005/docker-hello-world/latest)](https://hub.docker.com/)
[![GitHub Workflow Status](https://img.shields.io/github/actions/workflow/status/ChandruEswaran/docker-hello-world/docker.yml?branch=main)](https://github.com/ChandruEswaran/docker-hello-world/actions)

> A minimal static "Hello World" website served by Nginx inside a Docker container.  
> Built and maintained by **ChandruEswaran. D**.

---

## Table of contents

- [Overview](#overview)  
- [Project structure](#project-structure)  
- [Prerequisites](#prerequisites)  
- [Local: Build & Run with Docker](#local-build--run-with-docker)  
- [Optional: Using Docker Compose](#optional-using-docker-compose)  
- [Push image to Docker Hub (optional)](#push-image-to-docker-hub-optional)  
- [Github: upload & release steps](#github-upload--release-steps)  
- [Troubleshooting](#troubleshooting)  
- [License](#license)  
- [Contributing](#contributing)  
- [Contact](#contact)

---

## Overview

This repo demonstrates how to:

- Serve a static `index.html` via `nginx:alpine`.
- Build a Docker image for that site.
- Run the container on a local machine (mapped to a host port).
- (Optional) Push the image to Docker Hub or build via GitHub Actions.

> If you're new to Docker, this repo helps you understand how to build a Docker image from scratch and deploy a container running Nginx.

Perfect for learning Docker basics and static site deployment.

---

## Project structure

```bash
├── index.html
├── Dockerfile
└── README.md
```

> For the Requirements to undertand the workflows in this Docker Image progress.

```
├── index.html
├── Dockerfile
├── .dockerignore
├── docker-compose.yml # optional
├── README.md
└── .github/
└── workflows/
└── docker.yml # optional CI workflow
```

## Prerequisites

- Docker installed and running (Desktop for macOS/Windows or Docker Engine on Linux).  
  - Check with `docker --version` and `docker info`.
- (Optional) Docker Compose for `docker-compose up`.
- Git and (optionally) GitHub `gh` CLI if you want to automate repo creation.

---

## Local: Build & Run with Docker

1. **Build the Docker image**
   ```bash
   docker build -t chandru/hello-nginx:latest .
   ```

2. **Run the container**
   > Map container port 80 to host port 8080:
     ```bash
     docker run -d --name hello-nginx -p 8080:80 chandru/hello-nginx:latest
     ```

3. **Open in browser**
     - Navigate to: `http://localhost:8080` — you should see: Hello world — Docker!.
  
4. **Stop & remove**
   ```bash
   docker stop hello-nginx
   docker rm hello-nginx
   ```

5. **Remove image**
   ```bash
   docker rmi chandru/hello-nginx:latest
   ```

6. **Optional: Using Docker Compose**

    docker-compose.yml example (optional):

    ```bash
    version: '3.8'
    services:
      web:
        build: .
        image: chandru/hello-nginx:latest
        ports:
          - "8080:80"
    ```

7. **Start:**
    ```bash
    docker-compose up --build -d
    # Stop
    docker-compose down
    ```

## Push image to Docker Hub (optional)

1. Tag your local image for Docker Hub:
    
    ```bash
    docker tag chandru/hello-nginx:latest chan2005/docker-hello-world:latest
    ```
  
2. Login & push:

    ```bash
    docker login
    docker push chan2005/docker-hello-world:latest
    ```

## GitHub: upload & release steps

1. Initialize local git (if not already):

    ```bash
    git init
    git checkout -b main
    git add .
    git commit -m "chore: initial commit by Chandru"
    ```


2. Create a GitHub repo (web GUI or gh CLI):
   - GUI: Create repo at `https://github.com/new`, then follow the push instructions.
   - CLI:

    ```bash
    gh repo create chan2005/docker-hello-world --public --confirm
    ```

3. Add remote & push:

    ```bash
    git remote add origin https://github.com/ChandruEswaran/docker-hello-world.git
    git push -u origin main
    ```

4. Create a release (optional):

    ```bash
    git tag -a v1.0.0 -m "Initial release"
    git push origin v1.0.0
    ```


## Troubleshooting

  - Cannot build: Ensure Docker daemon is running `docker info`. Check file permissions.
  - Port conflict: If 8080 is in use, map to another `free port: -p 8081:80`.
  - Blank page / 404: Confirm `index.html` is copied into image. Inspect container:

    ```bash
    docker exec -it hello-nginx ls -la /usr/share/nginx/html
    ```
  
  - Windows path issues: Ensure Dockerfile has LF (\n) endings — convert if necessary.
  - Container logs:

    ```bash
    docker logs hello-nginx
    ```


### Contributing

Contributions welcome — open an issue or submit a pull request. Please follow the usual etiquette:

1. Fork the repo
2. Create a feature branch: `git checkout -b feature/my-change`
3. Commit changes: `git commit -m "feat: add X"`
4. Push: `git push origin feature/my-change`
5. Create a pull request


### License
This project is released under the MIT License. [See LICENSE](LICENSE) for details.

## Contact

Maintained by [ChandruEswaran](https://github.com/ChandruEswaran)
