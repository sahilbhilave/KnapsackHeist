package com.example.KnapsackHeist;

public class Player {
    private int capacity;
    private int score;

    // Constructor
    public Player(int capacity) {
        this.capacity = capacity;
        this.score = 0; // Initial score
    }

    // Getters and Setters
    public int getCapacity() {
        return capacity;
    }

    public void setCapacity(int capacity) {
        this.capacity = capacity;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }

    public void addScore(int points) {
        this.score += points;
    }
}

