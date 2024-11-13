# Coffee Shop POS System (Ruby on Rails + Docker)

A simplified Point of Sale (POS) system for an American-style coffee shop, designed to handle item sales (e.g., beverages, sandwiches, coffee mugs), including flexible tax handling, discounts, and notifications for order completion.

This system models real-world coffee shop transactions and provides endpoints to list items, place orders, and notify customers when their order is ready.

## Features

- **Items Management**: The coffee shop sells multiple types of items such as beverages, food, and merchandise (coffee mugs, etc.).
- **Flexible Tax Calculation**: Items can have varying tax rates or be tax-free.
- **Discounts and Offers**: Some items are offered for free or at a discount when ordered with other items.
- **Order Management**: Customers can place orders for multiple items at a time.
- **Order Notifications**: Customers are notified after a fixed period when their order is ready.
- **SQLite Database**: The system uses SQLite, a lightweight file-based database.
- **Docker Setup**: Fully containerized solution with Docker and Docker Compose for easy setup and deployment.
- **API Documentation**: Clear API documentation provided for testing endpoints.

## Prerequisites

Before setting up the project, make sure you have the following installed:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Project Setup Using Docker

Follow these steps to set up and run the Coffee Shop POS system with Docker:

### 1. Clone the Repository

First, clone this repository to your local machine:

```bash
git clone https://github.com/muhammad-umar-pisces/coffee-shop-assessment.git
cd coffee-shop-assessment
```

### 2. Run following command 
```bash
docker-compose build
```
then
```bash
docker-compose up
```

### 3. Now hit your endpoints on following
```bash 
http://localhost:3000
```