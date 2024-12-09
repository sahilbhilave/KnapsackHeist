<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Knapsack Heist - Home</title>
    <link href="https://cdn.jsdelivr.net/npm/tailwindcss@2.2.19/dist/tailwind.min.css" rel="stylesheet">
    <script>
        function toggleGameRules() {
            const gameRules = document.getElementById('game-rules');
            gameRules.classList.toggle('hidden');
        }

        function toggleAboutProject() {
            const aboutProject = document.getElementById('about-project');
            aboutProject.classList.toggle('hidden');
        }
    </script>
</head>
<body class="flex flex-col items-center justify-center min-h-screen bg-black text-white">
<header class="text-center mt-12">
    <h1 class="text-4xl md:text-6xl font-bold text-transparent bg-clip-text bg-gradient-to-r from-pink-500 to-purple-600">Knapsack Heist</h1>
    <p class="mt-4 text-xl md:text-2xl">Test your strategy and wit in this ultimate heist challenge!</p>
</header>

<div class="mt-6 text-center bg-gray-800 bg-opacity-90 p-4 rounded-md shadow-lg">
    <p class="text-xl">Your Current Score:</p>
    <p class="text-3xl font-bold text-yellow-400">${sessionScope.myscore}</p>
</div>

<div class="mt-10 space-x-4">
    <a href="game"
       class="px-6 py-3 bg-pink-600 hover:bg-pink-700 text-white font-bold rounded-lg shadow-lg transition transform hover:scale-105">
        Start Game
    </a>
</div>

<div class="mt-4 space-x-4">
    <button onclick="toggleGameRules()" class="px-4 py-2 bg-purple-600 hover:bg-purple-700 text-white font-bold rounded-lg shadow-lg transition transform hover:scale-105">
        Game Rules
    </button>
    <button onclick="toggleAboutProject()" class="px-4 py-2 bg-blue-600 hover:bg-blue-700 text-white font-bold rounded-lg shadow-lg transition transform hover:scale-105">
        About Project
    </button>
</div>

<div id="game-rules" class="mt-8 bg-gray-900 bg-opacity-90 p-6 rounded-lg shadow-lg max-w-2xl text-center hidden">
    <h2 class="text-2xl font-bold text-pink-500 mb-4">Game Rules</h2>
    <ul class="space-y-4 text-left text-gray-300">
        <li><b>Objective:</b> You are a robber aiming to maximize profit by stealing items and filling your knapsack efficiently.</li>
        <li><b>Capacity Limit:</b> Your knapsack has a maximum weight limit. Plan your heist carefully to avoid overloading it.</li>
        <li><b>Strategic Choices:</b> Each item has a specific weight and value. Prioritize high-value items that fit within your knapsack's capacity.</li>
        <li><b>Gameplay:</b>
            <ul class="pl-5 list-disc">
                <li>Drag items from the available list and drop them into your knapsack.</li>
                <li>Monitor the current weight and score displayed on the screen.</li>
            </ul>
        </li>
        <li><b>Time Limit:</b> You have only 15 seconds to select and finalize your items. Keep an eye on the timer!</li>
        <li><b>Winning Strategy:</b>
            <ul class="pl-5 list-disc">
                <li>Maximize your score by selecting the optimal combination of items.</li>
                <li>Achieve a perfect score by matching the maximum possible value to earn a bonus point!</li>
            </ul>
        </li>
        <li><b>Penalties:</b>
            <ul class="pl-5 list-disc">
                <li>Exceeding the knapsack's weight capacity will prevent you from adding more items.</li>
                <li>Unstrategic choices might leave high-value items behind and reduce your total score.</li>

            </ul>
        </li>
        <li>
            <b>It might be tricky at first to understand, but you'll get the hang of it after a few rounds</b>
        </li>
        <li class="text-red-500">
            <b>For The Geeks:</b>
            <ul class="pl-5 list-disc">
                <li>This game is based on the classic 0/1 Knapsack problem, a popular challenge in dynamic programming.</li>
                <li>The computer randomly generates items with different weights and values. It then calculates the maximum achievable value for a given knapsack (bag) capacity using optimal algorithm.</li>
                <li>Your mission? Apply your wit to match this maximum value within the given time. </li>
                <li>Good luck!</li>
            </ul>
        </li>
    </ul>
</div>

<div id="about-project" class="mt-8 bg-gray-900 bg-opacity-90 p-6 rounded-lg shadow-lg max-w-2xl  hidden">
    <h2 class="text-2xl font-bold text-blue-500 mb-4 text-center">About Project</h2>
    <ul class="text-left list-disc text-gray-300 space-y-2 ml-4">
        <li>
            Built using the <b>Spring MVC architecture</b>, with <b>JSP</b> utilized for the view layer.
        </li>
        <li>
            Leverages <b>Spring Boot Web</b> to simplify development and provide robust server-side functionalities.
        </li>

        <li>
            Incorporates effective session management by utilizing <b>session attributes</b> to maintain user-specific
            data across requests.
        </li>
        <li>
            Styled with <b>Tailwind CSS</b> and enhanced by interactive elements built with <b>JavaScript</b>.
        </li>

        <li>
            Powered by an embedded <b>Tomcat server</b> ensuring portability and seamless deployment without requiring
            external configurations.
        </li>
        <li>
            Deploys effortlessly using <b>Docker</b> enabling containerized delivery of the Spring Boot application for
            consistent and efficient deployment across environments.
        </li>
        <li>
            The project is implementation of the <b>0/1 Knapsack Problem</b> algorithm which showcases <b>dynamic programming</b> and <b>algorithm optimization</b> in the web.
        </li>

        <li>
            Explore the complete project on <b>GitHub</b> for detailed implementation and instructions:
            <a href="https://github.com/sahilbhilave/KnapsackHeist" target="_blank" class="text-blue-400 hover:underline">
                GitHub Repository Link
            </a>.
        </li>
    </ul>

</div>

<footer class="my-6 text-sm text-gray-400 text-center">
    <p>Developed By Sahil Bhilave, For Fun And Challenge!</p>
</footer>
</body>
</html>
