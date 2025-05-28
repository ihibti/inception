
# 🧱 Inception – Docker Infrastructure Project

This project is part of the **42 School Curriculum**. It aims to introduce students to containerization by setting up a secure and modular Docker-based infrastructure using `docker-compose`.

## 📚 Project Overview

The goal of Inception is to create a **multi-container environment** consisting of:
- A reverse proxy with **NGINX** using **TLSv1.2 or TLSv1.3**
- A **WordPress** site running with **php-fpm**
- A **MariaDB** database backend
- Isolated **Docker volumes** for data persistence
- A custom **Docker network** linking all services

The entire project runs inside a **Virtual Machine**, using only **custom-built Dockerfiles** (no prebuilt images allowed).

## 🛠 Services

| Service   | Description                         | Technologies       |
|---------- |-------------------------------------|--------------------|
| `nginx`   | HTTPS reverse proxy with TLS        | NGINX, OpenSSL     |
| `wordpress` | CMS with PHP backend               | WordPress, PHP-FPM |
| `mariadb` | Relational DB for WordPress         | MariaDB            |

All containers:
- Are built from **Debian** or **Alpine** base images
- Are started and managed with **docker-compose**
- Use **restart policies** to ensure availability
- Do **not** use any infinite loops or hacky patches

## 📦 File Structure

```bash
.
├── Makefile
├── secrets/
│   └── db_password.txt, credentials.txt, ...
├── srcs/
│   ├── .env
│   ├── docker-compose.yml
│   └── requirements/
│       ├── mariadb/
│       ├── wordpress/
│       └── nginx/
