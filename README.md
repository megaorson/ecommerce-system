# 🛒 E-commerce System (Microservices Pet Project)

This is a multi-service e-commerce system built with a microservices-like architecture.

## 🧩 Services

- ERP – built with Symfony (business logic, orders, API)
- PIM – built with Laravel (product data, attributes)
- Storefront – Magento 2 (frontend + checkout)

---

## 🏗️ Architecture

                Nginx (gateway)
                      |
     -------------------------------------
     |              |                    |
  ERP (Symfony)  PIM (Laravel)   Magento (Store)
     |              |                    |
 Postgres        MySQL              MySQL

- Single entry point via Nginx
- Services communicate via API
- Each service has its own database
- PHP-FPM used for all PHP services

---

## ⚙️ Tech Stack

- Docker / Docker Compose
- Nginx (reverse proxy)
- PHP-FPM
- Symfony
- Laravel
- Magento 2

---

## 🚀 Getting Started

### 1. Clone repository

git clone https://github.com/megaorson/ecommerce-system
cd ecommerce-system

---

### 2. Run setup

chmod +x setup.sh
./setup.sh

This will:

- Clone all service repositories
- Setup default magento database (no products)
- Configure local domains (/etc/hosts)
- Build and start Docker containers

---

## 🌐 Available Services

After setup:

- http://erp.local
- http://pim.local
- http://magento.local

---

## 🐳 Docker Commands

We use Makefile for better developer experience.

### Start containers

make dev

---

### Rebuild containers

make rebuild

---

### Reset environment (clean state)

make reset

---

### Stop containers

make stop

---

### View logs

make logs

---

## 🌐 Local Domains

127.0.0.1 erp.local
127.0.0.1 pim.local
127.0.0.1 magento.local

---

## 💡 Goals of the Project

- Practice microservice architecture
- Integrate multiple PHP frameworks
- Simulate real-world e-commerce system
- Improve DevOps & DX (Developer Experience)

---

## 🔥 Future Improvements

- OAuth authentication between services
- API Gateway / BFF layer
- Message broker (RabbitMQ)
- Frontend (Next.js or React.js)
- CI/CD pipeline

---

## 🧠 Notes

- Each service runs in isolation
- Nginx acts as a single entry point
- PHP-FPM is used instead of HTTP proxying
- Designed to be close to production setup

---

## 👨‍💻 Author

Viktor Burtsev
