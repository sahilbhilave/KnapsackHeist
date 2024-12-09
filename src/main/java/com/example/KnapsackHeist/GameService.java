package com.example.KnapsackHeist;

import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.LinkedList;
import java.util.List;
import java.util.Random;


@Service
public class GameService {
    private static final String[] ITEM_NAMES = {
            "Wallet", "Phone", "Painting", "Laptop", "Watch",
            "Necklace", "Camera", "Perfume", "Ring"
    };

    public List<Item> generateRandomItems() {
        List<Item> items = new ArrayList<>();
        Random random = new Random();

        for (String name : ITEM_NAMES) {
            int weight = random.nextInt(10) + 1;
            int value = random.nextInt(100) + 10;
            items.add(new Item(name, weight, value));
        }
        return items;
    }

    public MaxScoreResult calculateMaxPossibleScoreWithItems(List<Item> items, int knapsackCapacity) {
        int n = items.size();
        int[][] dp = new int[n + 1][knapsackCapacity + 1];

        for (int i = 1; i <= n; i++) {
            Item item = items.get(i - 1);
            for (int w = 0; w <= knapsackCapacity; w++) {
                if (item.getWeight() <= w) {
                    dp[i][w] = Math.max(dp[i - 1][w], dp[i - 1][w - item.getWeight()] + item.getValue());
                } else {
                    dp[i][w] = dp[i - 1][w];
                }
            }
        }

        // Traceback to find the items contributing to maxScore
        List<Item> bestItems = new LinkedList<>();
        int w = knapsackCapacity;
        for (int i = n; i > 0; i--) {
            if (dp[i][w] != dp[i - 1][w]) {
                Item item = items.get(i - 1);
                bestItems.add(0, item);
                w -= item.getWeight();
            }
        }
        return new MaxScoreResult(dp[n][knapsackCapacity], bestItems);
    }

}


