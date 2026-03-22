# 🚀 Microservices E-commerce System (Symfony + Magento)

![PHP](https://img.shields.io/badge/PHP-8.3-blue)
![Symfony](https://img.shields.io/badge/Symfony-6+-black)
![Magento](https://img.shields.io/badge/Magento-2-orange)
![Docker](https://img.shields.io/badge/Docker-Ready-blue)
![Architecture](https://img.shields.io/badge/Architecture-Microservices-green)

---

## 🧩 Overview

This project is a microservices-based e-commerce platform designed to simulate a real-world scalable architecture.

---

## 🧩 Services

| Service | Stack | Responsibility |
|--------|------|---------------|
| ERP | Symfony | Orders, business logic, APIs |
| PIM | Symfony | Products, attributes, variants |
| Storefront | Magento 2 | UI, checkout |

---

## 🏗️ Architecture

```
                Nginx (gateway)
                      |
     -------------------------------------
     |              |                    |
  ERP (Symfony)  PIM (Symfony)   Magento (Store)
     |              |                    |
 Postgres         MySQL                 MySQL
```

---

## 🔄 Data Flow

```
PIM → Magento (product sync)
Magento → ERP (orders)
ERP → PIM (product updates)
```

---

## 🧠 PIM Design

```
Product
 └── SKU (variant)
      └── Attribute Values
```

---

## ⚙️ Tech Stack

- Docker / Docker Compose
- Nginx (reverse proxy)
- PHP-FPM
- Symfony (ERP + PIM)
- Magento 2
- PostgreSQL / MySQL

---

## 🚀 Getting Started

### Clone repo

```
git clone https://github.com/megaorson/ecommerce-system
cd ecommerce-system
```

---

### Setup

```
chmod +x setup.sh
./setup.sh
```

---

### Magento keys

```
cp .env.local .env 
enter your pub and private key from magento https://marketplace.magento.com/customer/accessKeys/
```

---

## 🌐 Services

- http://erp.local
- http://pim.local/
- http://magento.local

---

## 🐳 Docker

```
make dev
make rebuild
make reset
make stop
make logs
```

---

## 🧠 Key Concepts

- PIM = Single Source of Truth
- ERP = Business Logic
- Magento = Presentation Layer
- API-first communication

---

## 🔥 Future

- OAuth / JWT
- Event-driven (RabbitMQ)
- GraphQL BFF
- React / Next.js frontend
- CI/CD

---

## 👨‍💻 Author

Viktor Burtsev
