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
    .table-container {
        display: flex;
        justify-content: space-between;
        margin: 0;  
    }
    .table-wrapper {
        width: 49%;  
        margin: 0;   
        padding: 0;  
    }
    table {
        width: 100%;
        border-collapse: collapse; 
    }
</style>

<body>

    <!-- Шапка с логотипом и меню -->
    <header>
        <div class="container">
            <img src="/static/logo.svg" alt="Логотип" class="logo">
            <nav>
                <div class="nav-item">
                    <a href="/">Главная</a>
                </div>
                <div class="nav-item">
                    <a href="/test">Пройти тест</a>
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

            <div class="card-header text-center bg-info text-white">
                <p class="text-muted">Здесь вы сможете найти информацию о наполнении базы заданий, а точнее их количество по номерам и уровню сложности!</p>
            </div>
            
            <div class="card-header text-center bg-info text-white">
                <h3>Информация о базе заданий:</h3>
            </div>

            <img src="static/tasks_distribution.svg" alt="Круговая диаграмма распределечения уровней задач" style="width: 750px; height: auto;">

            <div class="table-container">
                <div class="table-wrapper">
                    <table border="1" cellpadding="5" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Номер задачи</th>
                                <th>Количество задач</th>
                            </tr>
                        </thead>
                        <tbody>
                            {% for task, count in total_tasks_part1 %}:
                            <tr>
                                <td>{{task}}</td>
                                <td>{{count}}</td>
                            </tr>
                            {% endfor %}
                        </tbody>
                    </table>
                </div>

                <div class="table-wrapper">
                    <table border="1" cellpadding="5" cellspacing="0">
                        <thead>
                            <tr>
                                <th>Номер задачи</th>
                                <th>Количество задач</th>
                            </tr>
                        </thead>
                        <tbody>
                            {% for task, count in total_tasks_part2 %}:
                            <tr>
                                <td>{{task}}</td>
                                <td>{{count}}</td>
                            </tr>
                            {% endfor %}
                        </tbody>
                    </table>
                </div>
            </div>

            <tfoot>
                <tr>
                    <h3><strong>Общее количество задач в базе: {{total_tasks}}</strong></h3>
                </tr>
            </tfoot>

            <div class="card-body">
                <p class="text-center">Пройдите пробное испытание, чтобы оценить свои знания и подготовиться к экзамену.</p>
                <p class="text-center">Для этого нажмите на кнопку ниже, далее вы перейдете на вкладку решения заданий.</p>
                <form action="/test" method="post" class="needs-validation" novalidate>
                    <!-- Кнопка начать тест -->
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Начать тест</button>
                    </div>
                </form>

                <form action="/update_tasks" method="post" class="needs-validation" novalidate onsubmit="showLoader()">
                    <div class="text-center">
                        <button type="submit" class="btn btn-primary">Обновить базу данных</button>
                    </div>
                </form>

                <div id="loader" style="display: none; text-align: center; margin-top: 20px;">
                    <div class="spinner-border text-primary" role="status">
                        <span class="visually-hidden">Загрузка...</span>
                    </div>
                    <p>Обновление базы данных...Процесс занимает около 8 - 10 минут!</p>
                </div>

            </div>
        </div>
    </div>

    <script>
        function showLoader() {
            document.querySelector('form').style.display = 'none'; // Скрыть форму
            document.getElementById('loader').style.display = 'block'; // Показать лоадер
        }
    </script>


    <!-- Подвал -->
    <footer class="text-center py-3 mt-5">
        <p>&copy; 2024 Учебный проект "Платформа КЕГЭ 2024/2025" по Python (Декабрь 2024). Все права защищены.</p>
    </footer>

    <!-- Подключение Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0nB7rAk2F7kr5g4ptLsz5lCfhZ3oJbe/Kfqd/OEKi4IInKAM" crossorigin="anonymous"></script>
</body>
</html>
