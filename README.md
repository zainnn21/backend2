# Development of a REST API for the 'Edu Course' Application using Node.js and Express.js

This project aims to build the server-side (back-end) of the "Edu Course" application using the Node.js and Express.js framework. The development process includes several key stages, from configuring the database connection, implementing Data Manipulation Language (DML) functions for data operations (SELECT, INSERT, UPDATE, DELETE), to building a functional REST API with corresponding endpoints. Each endpoint was tested using Postman to ensure all features work as expected.

## Prerequisites

Before you begin, ensure you have the following installed on your system:

- [Docker](https://docs.docker.com/get-docker/)
- [Docker Compose](https://docs.docker.com/compose/install/)

## Getting Started

Follow these steps to get your development environment set up and running.

### 1. Clone the repository

```sh
git clone <https://github.com/zainnn21/backend2.git>
cd <backend2>
```

### 2. Configure Environment Variables

The application uses environment variables for database configuration. You'll need to create a `.env` file in the root of the project.

You can copy the example file:

```sh
cp .env.example .env
```

**Note:** The `DB_PORT` should be `5432` as this is the port the `db` service uses internally within the Docker network. The host machine will access the database via port `5433`.

### 3. Build and Run the Application

Use Docker Compose to build the images and start the services.

```sh
docker-compose up --build
```

To run the services in the background (detached mode), use:

```sh
docker-compose up --build -d
```

### 4. Accessing the Services

- **Application**: The application will be running and accessible at `http://localhost:3000`.
- **Database**: The PostgreSQL database can be accessed from your host machine on `localhost:5433`.

### Database Initialization

On the first run, Docker Compose will automatically initialize the database. The `docker-compose.yml` file mounts the `./src/init` directory into the PostgreSQL container's initialization path (`/docker-entrypoint-initdb.d`). Any `.sql` scripts in that directory will be executed to create tables and seed initial data.

### Stopping the Application

To stop and remove the containers, networks, and volumes, run:

```sh
docker-compose down
```
