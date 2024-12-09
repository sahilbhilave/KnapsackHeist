# Knapsack Heist

**Knapsack Heist** is a fun and challenging web-based game built around the 0/1 Knapsack Problem using **Spring Boot** and **JSP**. The objective is to strategically pick items to maximize your score while staying within the weight limit of your knapsack. The game is optimized using **Dynamic Programming**.

This project is built with **Spring MVC**, **Tailwind CSS**, and **JavaScript** for dynamic gameplay. It's containerized with **Docker** for easy deployment.

Game is deployed on Render.com : https://knapsackheist.onrender.com/

## Features

- **Web-based game** built with **Spring Boot** and **JSP**.
- **Dynamic Programming** algorithm to solve the 0/1 Knapsack Problem.
- **Drag and Drop** gameplay to select items and place them in your knapsack.
- **Session management** to store user-specific data.
- **Timer-based challenge** to make the game more exciting.
- **Dockerized application** for easy deployment.

## Project Overview

The game is based on the **0/1 Knapsack Problem** where the user has a limited capacity for their knapsack, and they need to select a set of items with maximum value without exceeding the weight capacity. 

### How to Play

1. **Start Game**: Click on "Start Game" to begin the challenge.
2. **Drag Items**: Choose from available items and drag them into the knapsack area.
3. **Maximize Your Score**: Try to pick items that maximize the total value without exceeding the knapsack’s weight limit.
4. **Timer**: You have 15 seconds to make your choices, so act fast!
5. **Win Condition**: Try to achieve the highest score possible within the time limit.

### Technology Stack

- **Spring Boot** for backend development.
- **JSP** for the front-end view layer.
- **Tailwind CSS** for modern, responsive styling.
- **Docker** for containerization.
- **JavaScript** for dynamic interaction and game logic.

## Setup Instructions

### Build With

- **Spring Boot 3.4.0**
- **Java 23** 
- **Docker** 
- **Maven**
- **Jar Packaging**

### Running Locally

#### 1. Clone the Repository

```bash
git clone https://github.com/your-username/KnapsackHeist.git
cd KnapsackHeist
```

2. Build the Project
You can build the project using Maven:
```bash
./mvnw clean package
```
4. Run the Application Locally
To run the application locally, use the following command:
```bash
./mvnw spring-boot:run
```
Your application will be running at http://localhost:8080.

## Docker Setup
This project is Dockerized for easy deployment. To build and run the Docker container:

1. Build the Docker Image
Run the following command to build the Docker image:
```bash
docker build -t knapsack-heist
```
2. Run the Docker Container
After the image is built, run the Docker container:
```bash
docker run -p 8080:8080 knapsack-heist
```

The game will now be accessible at http://localhost:8080
