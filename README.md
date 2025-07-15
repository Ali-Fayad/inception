# Inception

> **42 Project** – Docker, System Administration & DevOps fundamentals  
> By [Ali Fayad](https://github.com/Ali-Fayad)

---

## 🚀 Project Description

This project is part of the 42 cursus. Its goal is to introduce you to the world of system administration and DevOps using **Docker**.

You will create a fully functional **WordPress website** running on top of an **Nginx web server**, secured by **SSL**, with a **MariaDB database**, all orchestrated by **Docker Compose**.

---

## 🏗️ Project Architecture

```
.
├── srcs/
│   ├── docker-compose.yml
│   ├── containers/
│   │   ├── Nginx/
│   │   │   └── Dockerfile
│   │   ├── WordPress/
│   │   │   └── Dockerfile
│   │   └── MariaDB/
│   │       └── Dockerfile
│   └── ...
├── Makefile
└── README.md
```

- **Nginx**: Serves the WordPress site over HTTPS (SSL).
- **WordPress + PHP-FPM**: Your blogging platform.
- **MariaDB**: Database to store WordPress data.
- **Volumes**: Persistent data for WordPress and MariaDB.
- **Docker Networks**: Ensures secure communication between containers.

---

## ⚙️ Usage

### 🚢 Build & Run

```bash
make
```

This will:
- Build the Docker images.
- Start the containers in detached mode.

### 🛑 Stop & Clean

```bash
make down
```

To remove volumes too (⚠️ this will erase your DB data):

```bash
make fclean
```

---

## 🌐 Access the Website

- Open your browser and go to:  
  ```
  https://localhost
  ```
- If using Docker inside a VM (like VirtualBox), replace `localhost` with your VM IP (e.g. `https://192.168.56.10`).

---

## 🔑 SSL

The Nginx container is configured with self-signed SSL certificates.  
This means your browser might show a warning. You can safely accept it for testing purposes.

---

## 👨‍💻 Author

- **Ali Fayad**  
  [GitHub: Ali-Fayad](https://github.com/Ali-Fayad)

---

## 🚀 Bonus Ideas

✅ You can implement additional services like:
- **Redis Cache**
- **FTP server**
- **Adminer**
- **Multi-site WordPress**
- **Monitoring with Telegraf + InfluxDB + Grafana**

---

## 📝 License

This project is part of the **42 Network curriculum**, thus subject to their academic integrity policy.

---
