<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
        <link rel="shortcut icon" href="/static/favicon.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Генерация вариантов</title>
    <!-- Подключение Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJRDBu2mC4j4BLzN3xp7bXwJb5RntKnjsm0KGRhPoL5fyyUz1DzHMi9sWV0n" crossorigin="anonymous">
    <!-- Подключение кастомных стилей -->
    <link href="/static/style.css" rel="stylesheet">
</head>

<style>
    .task-wrapper {
        margin-bottom: 30px; /* Отступ между задачами */
    }
    .task-header {
        font-size: 18px;
        font-weight: bold;
    }
    #timer, #total-score-container {
        font-size: 24px;
        font-weight: bold;
        color: red;
        position: fixed;
        top: 10px;
        left: 50%;
        transform: translateX(-50%);
        background-color: white;
        padding: 10px;
        border: 2px solid #ccc;
        z-index: 1000; /* Чтобы блоки были поверх контента */
    }
    #total-score-container {
        top: 60px; /* Отступ от таймера */
    }

    /* Стили для инпута баллов */
    .score-input {
        font-size: 18px;
        padding: 10px;
        width: 150px;
        border-radius: 5px;
        border: 2px solid #ccc;
        box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    }

    .total-score {
        font-size: 20px;
        font-weight: bold;
    }

    /* Стили для размытости фона */
    #overlay {
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        height: 100%;
        background: rgba(0, 0, 0, 0.5);
        z-index: 999; /* Над всем остальным контентом */
        display: none; /* Скрыто по умолчанию */
        backdrop-filter: blur(10px); /* Размытие фона */
    }

    /* Стиль для модального окна */
    .modal {
        display: none; /* Скрыто по умолчанию */
        z-index: 1001; /* Модальное окно поверх всего */
    }

    .btn-custom {
        font-size: 10px; 
        padding: 2px 5px; 
        height: auto; 
        width: auto; 
        display: inline-block; 
    }
</style>

<body>

    <!-- Таймер -->
    <div id="timer"></div>

    <!-- Показание баллов -->
    <div id="total-score-container">
        Общее количество первичных баллов: <span id="total-score">0</span>
    </div>

    <!-- Шапка с логотипом и меню -->
    <header>
        <div class="container">
            <img src="/static/logo.svg" alt="Логотип" class="logo">
            <nav>
                <div class="nav-item">
                    <a href="/">Главная</a>
                </div>
                <div class="nav-item">
                    <a href="/tests">Пройти тест</a>
                </div>
                <div class="nav-item">
                    <a href="/agreement">Лицензионное соглашение</a>
                </div>
                <div class="nav-item">
                    <a href="/contacts">Контакты</a>
                </div>
            </nav>
        </div>
    </header>

    <!-- Приветствие и форма для прохождения пробного испытания -->
    <div class="container mt-5">
        <div class="card shadow">
            <div class="card-header text-center bg-info text-white">
                <h3>Добро пожаловать на платформу подготовки к ЕГЭ по Информатике</h3>
            </div>

            <form action="/test" method="POST" id="generate-form">
                <button type="submit" class="btn btn-primary">Сгенерировать новый вариант</button>
            </form>

            <div id="variant-container">
                <h2>Сгенерированный вариант:</h2>
                <form id="task-form" method="POST">
                    {% for task_number, task_info in variant|dictsort %}
                        <div class="task-wrapper">
                            <div class="card">
                                <div class="card-header bg-secondary text-white task-header">
                                    <strong><h2>Номер задачи: {{ task_number }}</h2></strong>
                                </div>
                                <div class="card-body">
                                    <p><strong>Текст задачи:</strong> {{ task_info['fulltext'] | safe }}</p>
                                    <button type="button" class="btn btn-secondary btn-small" onclick="toggleSolution('{{ task_number }}')">Показать решение</button>
                                    <div id="solution-{{ task_number }}" class="task-content" style="display:none;">
                                        <p> {{ task_info['solution'] | safe }}</p>
                                    </div>

                                    <div class="mt-3">
                                        <label for="score-{{ task_number }}">Баллы за задачу:</label>
                                        <input type="number" id="score-{{ task_number }}" name="score-{{ task_number }}" class="score-input" min="0" value="0" data-task-number="{{ task_number }}" onchange="updateTotalScore()">
                                    </div>

                                    <button type="button" class="btn btn-secondary btn-small" onclick="saveScore('{{ task_number }}')">Сохранить баллы</button>
                                </div>
                            </div>
                        </div>
                    {% endfor %}
                    <div class="mt-3">
                        <button type="button" class="btn btn-danger btn-small" id="end-test-button">Завершить тестирование</button>
                    </div>
                </form>
            </div>
        </div>
    </div>

    <script>
        // Очистка localStorage при загрузке страницы
        document.addEventListener("DOMContentLoaded", function() {
            // Очищаем localStorage при перезагрузке страницы
            localStorage.clear();
            
            // Загружаем сохраненные баллы для каждой задачи
            const scoreInputs = document.querySelectorAll('.score-input');
            scoreInputs.forEach(input => {
                const taskNumber = input.getAttribute('data-task-number');
                const savedScore = localStorage.getItem('score-' + taskNumber);
                if (savedScore) {
                    input.value = savedScore;
                }
            });

            // Обновляем общее количество баллов после загрузки страницы
            updateTotalScore();
        });


        function saveScore(taskNumber) {
            const score = document.getElementById('score-' + taskNumber).value;

            // Сохраняем баллы в localStorage
            localStorage.setItem('score-' + taskNumber, score);

            // Выводим подтверждение
            alert('Баллы за задачу ' + taskNumber + ' сохранены: ' + score);
            
            // Для обновления общего количества баллов на странице
            updateTotalScore();
        }

        function updateTotalScore() {
            let totalScore = 0;
            const scoreInputs = document.querySelectorAll('.score-input');
            scoreInputs.forEach(input => {
                totalScore += parseInt(input.value) || 0;
            });
            document.getElementById('total-score').innerText = totalScore;
        }

        function toggleSolution(taskNumber) {
            const solution = document.getElementById('solution-' + taskNumber);
            if (solution.style.display === "none") {
                solution.style.display = "block";
            } else {
                solution.style.display = "none";
            }
        }

        function endTest() {
            const totalScore = document.getElementById('total-score').innerText;

            const result = confirm(`Результаты тестирования:\nОбщее количество баллов: ${totalScore}\nОсталось времени: ${hours}ч ${minutes}м ${seconds}с\n\nВернуться на главную страницу?`);
            if (result) {
                window.location.href = '/'; // Переход на главную
            }
        }


        // Таймер на 3 часа 55 минут
        let time = 3 * 60 * 60 + 55 * 60; // 3 часа 55 минут в секундах
        let hours = Math.floor(time / 3600);
        let minutes = Math.floor((time % 3600) / 60);
        let seconds = time % 60;

        function updateTimer() {
            hours = Math.floor(time / 3600);
            minutes = Math.floor((time % 3600) / 60);
            seconds = time % 60;    
            document.getElementById('timer').innerText = `Осталось времени: ${hours}ч ${minutes}м ${seconds}с`;

            if (time > 0) {
                time--;
            } else {
                clearInterval(timerInterval);
                alert('Время вышло! Тестирование завершено.');
                endTest(); // В случае, если время вышло, показываем результаты
            }
        }

        const timerInterval = setInterval(updateTimer, 1000);

        // Завершаем тестирование по кнопке
        document.querySelector('#end-test-button').addEventListener('click', function(event) {
            event.preventDefault(); // Отменяем стандартное поведение формы
            endTest(); // Показываем окно с результатами
        });

        // Обработчик кнопки для перехода на главную страницу
        document.getElementById('go-home-btn').addEventListener('click', function() {
            window.location.href = '/'; // Перенаправление на главную страницу
        });

        // Очистка localStorage при генерации нового варианта
        document.querySelector('#generate-form').addEventListener('submit', function() {
            localStorage.clear(); // Очистить старые баллы
        });
    </script>

    <script type="text/javascript" async
        src="https://cdn.jsdelivr.net/npm/mathjax@3/es5/tex-mml-chtml.js">
    </script>

    <!-- Подвал -->
    <footer class="text-center py-3 mt-5">
        <p>&copy; 2024 Учебный проект "Платформа КЕГЭ 2024/2025" по Python (Декабрь 2024). Все права защищены.</p>
    </footer>

    <!-- Подключение Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0nB7rAk2F7kr5g4ptLsz5lCfhZ3oJbe/Kfqd/OEKi4IInKAM" crossorigin="anonymous"></script>
</body>
</html>
