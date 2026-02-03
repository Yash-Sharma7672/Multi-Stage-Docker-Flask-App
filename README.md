# Multi-Stage Docker Flask App 🚀

A **production-ready Flask application** fully containerized with **Docker using multi-stage builds**.  
This approach creates a **small, secure, and efficient image** suitable for real-world deployment.

---

## 🔹 Project Structure

Multi-Stage-Docker-Flask-App/
├── app/
│ ├── main.py
│ └── requirements.txt
├── Dockerfile
├── .dockerignore
├── README.md
├── LICENSE
└── diagrams/
└── docker-flask-network.png


---

## 🔹 Features

- Multi-stage Docker build  
- Gunicorn production server  
- Non-root user execution  
- Lightweight image  
- Beginner-friendly  

---

## 🔹 Prerequisites

- Docker ([Install](https://www.docker.com/get-started))  
- Git ([Install](https://git-scm.com/downloads))  
- Python knowledge (optional)  

---

## 🔹 Build & Run Instructions

### Clone the repository
git clone https://github.com/Yash-Sharma7672/Multi-Stage-Docker-Flask-App.git 
cd Multi-Stage-Docker-Flask-App

-> Build Docker image:
docker build -t flask-prod-multi-stage .

-> Run container:
docker run -d -p 5000:5000 --name flask-multi-container flask-prod-multi-stage

-> Verify container:
docker ps

-> Access app:
http://localhost:5000

-> View logs:
docker logs flask-multi-container

-> Enter in container shell:
docker exec -it flask-multi-container bash

-> Stop and remove container:
docker stop flask-multi-container
docker rm flask-multi-container

-> Rebuild after code changes:
docker stop flask-multi-container
docker rm flask-multi-container
docker build -t flask-prod-multi-stage .
docker run -d -p 5000:5000 --name flask-multi-container flask-prod-multi-stage

