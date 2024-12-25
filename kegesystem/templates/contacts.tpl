<!DOCTYPE html>
<html lang="ru">
<head>
    <meta charset="UTF-8">
    <link rel="shortcut icon" href="/static/favicon.png" type="image/x-icon">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Лицензионное соглашение</title>
    <!-- Подключение Bootstrap -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEJRDBu2mC4j4BLzN3xp7bXwJb5RntKnjsm0KGRhPoL5fyyUz1DzHMi9sWV0n" crossorigin="anonymous">
    <!-- Подключение кастомных стилей -->
    <link href="/static/style.css" rel="stylesheet">

    <style>
        /* Белый фон для карточки */
        .card {
            border-radius: 10px;
            overflow: hidden;
            transition: transform 0.3s ease;
            background-color: #fff; /* Белый фон для выделения */
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); /* Легкая тень для выделения карточки */
        }

        .card:hover {
            transform: translateY(-5px); /* Легкое поднятие карточки при наведении */
        }

        /* Стиль изображения */
        .card img {
            object-fit: cover; /* Картинка будет адаптироваться по размеру блока, сохраняя пропорции */
            height: 100%;
        }

        /* Описание */
        .card-text {
            font-size: 16px; /* Увеличиваем размер шрифта */
            color: #555;
            line-height: 1.6; /* Улучшает читаемость текста */
        }

        /* Заголовок карточки */
        .card-title {
            font-size: 22px; /* Увеличиваем размер заголовка */
            font-weight: bold;
            color: #333; /* Немного темнее цвет для заголовка */
        }

        /* Кнопка "Подробнее" */
        .btn-primary {
            background-color: #0056B3;
            border-color: #0056B3;
            border-radius: 25px; /* Закругленные углы для кнопки */
            padding: 10px 25px; /* Немного увеличиваем размеры кнопки для лучшего вида */
            font-size: 16px; /* Увеличиваем размер шрифта для кнопки */
            color: #F5F5F5;
            font-weight: bold;
            transition: background-color 0.3s ease;
        }

        .btn-primary:hover {
            background-color: #0056b3;
            border-color: #004085;
        }

        /* Подпись "Ничего не найдено" */
        .text-muted {
            color: #777;
            font-size: 18px; /* Увеличиваем размер шрифта для текста "ничего не найдено" */
            font-weight: 500;
        }

        /* Стиль для карточек внутри колонок */
        .card-body {
            padding: 20px;
        }
    </style>


    <style>
        /* Стиль для выпадающих списков */
        .form-select {
            max-height: 250px;
            overflow-y: auto;
            position: relative;
            z-index: 9999;
            width: 100%;
            font-size: 14px;
            padding: 5px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #fff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease;
        }

        .form-select option {
            padding: 8px;
        }

        .form-select:focus {
            outline: none;
        }

        .form-select:hover {
            box-shadow: 0 2px 15px rgba(0, 0, 0, 0.2);
        }

        /* Стили для лоадера */
        .loader {
            display: none;
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(255, 255, 255, 0.8);
            z-index: 1000;
            justify-content: center;
            align-items: center;
        }

        .loader .spinner-border {
            width: 3rem;
            height: 3rem;
        }

        /* Стили для формы и элементов */
        .input-group {
            display: flex;
            align-items: center;
            gap: 8px;
        }

        .input-group-text {
            font-size: 14px;
            font-weight: 500;
            color: #555;
        }

        .custom-input {
            flex: 1;
            border: 1px solid #ccc;
            border-radius: 6px;
            padding: 8px 12px;
            font-size: 14px;
            color: #333;
            transition: all 0.3s ease;
            box-shadow: inset 0 1px 2px rgba(0, 0, 0, 0.1);
        }

        .custom-input:focus {
            border-color: #007BFF;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.3);
            outline: none;
        }

        .mb-3 {
            margin-bottom: 1.5rem;
        }

        .form-label {
            font-weight: bold;
            margin-bottom: 8px;
            font-size: 16px;
            color: #222;
        }
    </style>
</head>
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

    <div class="container mt-5">
        <h1 class="text-center">Контакты</h1>
        <p class="text-muted text-center">Свяжитесь с мной по вопросам или предложениями. Я всегда рад помочь!</p>
        
        <div class="row">
            <!-- Контактная информация -->
            <div class="col-md-6">
                <h2>Наши контакты</h2>
                <ul class="list-unstyled">
                    <li><strong>Телефон:</strong> <a href="tel:+79931334652">+7 (993) 133-45-62</a></li>
                    <li><strong>Email:</strong> <a href="mailto:renar.yagafarov@yandex.ru">renar.yagafarov@yandex.ru</a></li>
                    <li><strong>Адрес:</strong> г. Уфа, ул. Примерная, д. 10, офис 15</li>
                </ul>
            </div>

            <div class="col-md-6">
                <h2>Где найс найти? Юридический адрес и оффис: </h2>
                <script type="text/javascript" charset="utf-8" async src="https://api-maps.yandex.ru/services/constructor/1.0/js/?um=constructor%3A39d716980a342b1efaad985a477f01441e17edd0a9ade3fbb68bf05f3c97dcdf&amp;width=500&amp;height=500&amp;lang=ru_RU&amp;scroll=true"></script>
            </div>
            

            <div>
                <h2>Социальный сети разработчика платформы:</h2>
                <div class="social-links">
                    <a href="https://vk.com/renarday" target="_blank" class="VK">VK</a>
                    <a href="https://t.me/renarday" target="_blank" class="TG">TG</a>
                </div>
            </div>

            <!-- Форма обратной связи -->
            <div class="mt-4">
                <h4>Форма обратной связи</h4>
                <form class="form-contact">
                    <script src="https://forms.yandex.ru/_static/embed.js"></script><iframe src="https://forms.yandex.ru/u/6760a82790fa7b41c624c855/?iframe=1" frameborder="0" name="ya-form-6760a82790fa7b41c624c855" width="650"></iframe>
                </form>
            </div>
            
        </div>
    </div>


    <!-- Подвал -->
    <footer class="text-center py-3 mt-5">
        <p>&copy; 2024 Учебный проект "Платформа КЕГЭ 2024/2025" по Python (Декабрь 2024). Все права защищены.</p>
    </footer>

    <!-- Подключение Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-pzjw8f+ua7Kw1TIq0nB7rAk2F7kr5g4ptLsz5lCfhZ3oJbe/Kfqd/OEKi4IInKAM" crossorigin="anonymous"></script>
</body>
</html>
