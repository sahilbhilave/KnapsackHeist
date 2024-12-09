<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Knapsack Heist - Game</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.0.3/dist/tailwind.min.css" rel="stylesheet">
    <style>
        #items, #knapsack {
            display: flex;
            flex-wrap: wrap;
            gap: 1rem;
        }
        #knapsack {
            min-height: 200px;
            background: #2e3a4e;
            padding: 1rem;
            border: 2px solid #475569;
            border-radius: 8px;
            overflow-y: auto;
        }
    </style>
    <script>
        let timer = 15;
        const knapsackCapacity = ${knapsackCapacity};
        let currentWeight = 0;
        const gameData = document.getElementById('gameData');
        const maxPossibleScore = ${maxPossibleScore};
        let score = 0;

        function startTimer() {
            const timerElement = document.getElementById('timer');
            const interval = setInterval(() => {
                if (timer > 0) {
                    timer--;
                    timerElement.textContent = timer;
                } else {
                    clearInterval(interval);
                    const modal = document.getElementById('modal');
                    const modalMessage = document.getElementById('modalMessage');

                    if(score === maxPossibleScore){
                        modalMessage.innerHTML = "<p class='text-center text-3xl text-green-500'>🎉 You Win!</p>  <p class='text-center text-xl mt-6 text-green-600'>You Have Max Score "+score+" </p>  <p class='text-center text-lg'> You win <span class='text-green-500'>+1</span> point </p>";
                        document.getElementById("close-btn").className = "modal-button bg-green-500 hover:bg-green-600 text-white py-2 px-6 rounded-lg";
                    }
                    else {
                        modalMessage.innerHTML = "<p class='text-center text-3xl text-red-500'>💔 You Lose!</p> <p class='text-center text-xl mt-6 text-red-500'>Your score: "+score+" </p> <p class='text-center text-lg text-green-500'>Max Score Possible : "+maxPossibleScore+"</p>";
                        document.getElementById("close-btn").className = "modal-button bg-red-500 hover:bg-red-600 text-white py-2 px-6 rounded-lg";
                    }
                    modal.style.display = 'flex';
                }
            }, 1000);
        }

        function closeModal() {
            window.location.href = score === maxPossibleScore ? '/xuz' : '/';
        }

        function initializeKnapsack() {
            document.getElementById("capacity").textContent = knapsackCapacity;
        }

        function drag(event) {
            event.dataTransfer.setData("item", event.target.id);
        }

        function drop(event) {
            event.preventDefault();
            const itemId = event.dataTransfer.getData("item");
            const itemElement = document.getElementById(itemId);
            const weight = parseInt(itemElement.getAttribute("data-weight"));
            const value = parseInt(itemElement.getAttribute("data-value"));

            if (currentWeight + weight <= knapsackCapacity) {
                currentWeight += weight;
                score += value;
                document.getElementById("knapsack").appendChild(itemElement);
                document.getElementById("currentWeight").textContent = currentWeight;
                document.getElementById("score").textContent = score;

                itemElement.setAttribute("draggable", "false");
                itemElement.style.cursor = "not-allowed";
            } else {
                const knapsack = document.getElementById("knapsack");
                knapsack.style.border = "2px solid red";
                setTimeout(() => {
                    knapsack.style.border = "";
                }, 2000);

                const messageElement = document.getElementById("error-message");
                messageElement.textContent = "Knapsack capacity exceeded!";
                setTimeout(() => {
                    messageElement.textContent = "";
                }, 2000);
            }
        }

        function allowDrop(event) {
            event.preventDefault();
        }

        window.onload = function () {
            startTimer();
            initializeKnapsack();
        };
    </script>
</head>
<body class="flex flex-col items-center justify-center min-h-screen bg-black text-white">

<div class="container mx-auto px-4 py-8">
    <header class="text-center mt-6 my-12">
        <h1 class="text-3xl md:text-5xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-pink-500 to-purple-600">
            Knapsack Heist
        </h1>
    </header>



    <div class="flex flex-col lg:flex-row gap-6">
        <!-- Knapsack Section -->
        <div class="flex-1 bg-gray-800 p-6 rounded-lg shadow-lg">
            <h2 class="text-xl md:text-2xl font-bold mb-4">Your Knapsack (Drag items here)</h2>
            <div id="knapsack"
                 class="bg-gray-700 h-48 md:h-60 p-4 rounded-md overflow-auto"
                 ondrop="drop(event)"
                 ondragover="allowDrop(event)">
                <p class="text-gray-400"></p>
            </div>
            <p id="error-message" class="text-red-400 mt-3"></p>
            <div class="mt-4">
                <p class="text-lg md:text-xl">Knapsack Capacity: <span id="capacity">0</span></p>
                <p class="text-lg md:text-xl">Current Weight: <span id="currentWeight">0</span></p>
                <p class="text-lg md:text-xl">Score: <span id="score">0</span></p>
            </div>
            <div class="text-center my-8">
                <p class="text-xl md:text-2xl text-green-500 font-bold">⏳ Time Remaining: <span id="timer">15</span>s</p>
            </div>
        </div>

        <!-- Items Section -->
        <div class="flex-1 bg-gray-800 p-6 rounded-lg shadow-lg">
            <h2 class="text-xl md:text-2xl font-bold mb-4">Available Items</h2>
            <div id="items" class="space-y-3">
                <c:forEach var="item" items="${items}">
                    <div id="item-${item.name}"
                         class="p-4 rounded-md bg-purple-800 text-white cursor-pointer shadow-md"
                         draggable="true"
                         ondragstart="drag(event)"
                         data-weight="${item.weight}"
                         data-value="${item.value}">
                        <p class="text-sm md:text-base"><b>${item.name}</b></p>
                        <p class="text-xs md:text-sm">Weight: ${item.weight}</p>
                        <p class="text-xs md:text-sm">Value: ${item.value}</p>
                    </div>
                </c:forEach>
            </div>
        </div>
    </div>
</div>

<!-- Modal -->
<div id="modal" class="modal-overlay fixed top-0 left-0 right-0 bottom-0 bg-black bg-opacity-70 hidden justify-center items-center">
    <div class="modal bg-gray-800 text-white rounded-lg p-6 text-center w-4/5 max-w-md">
        <p id="modalMessage" class="text-2xl font-bold mb-4"></p>
        <div class="text-center">
            <h2 class="text-xl md:text-2xl font-bold mb-2">Best Items</h2>
            <ul class="list-disc mb-4 text-center">
                <c:forEach var="item" items="${bestItems}">
                    <p class="text-center"><span class="text-green-500 font-bold">${item.name}</span> (<b>Weight:</b> ${item.weight}, <b>Value:</b> ${item.value})</p>
                </c:forEach>
            </ul>
        </div>
        <button id="close-btn" class="bg-blue-500 hover:bg-blue-600 text-white py-2 px-6 rounded-lg" onclick="closeModal()">Close</button>
    </div>
</div>

</body>
</html>
