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

    <div class="container">
        <h1 class="text-center">Лицензионное соглашение</h1>
        <p class="text-muted">Перед использованием платформы, предоставляющей доступ к пробникам и заданиям, пожалуйста, ознакомьтесь с данным Лицензионным соглашением. Использование платформы означает согласие с изложенными ниже условиями.</p>

        <div class="agreement-text">
            <p><strong>1. ОПРЕДЕЛЕНИЯ</strong></p>
            <p>1.1. Платформа — веб-сайт, предоставляющий доступ к образовательным материалам, пробникам и заданиям.</p>
            <p>1.2. Пользователь — физическое лицо, использующее функционал платформы для обучения и подготовки.</p>
            <p>1.3. Администрация — владелец и администратор платформы.</p>

            <p><strong>2. УСЛОВИЯ ИСПОЛЬЗОВАНИЯ</strong></p>
            <p>2.1. Платформа предоставляет доступ к пробникам и заданиям для подготовки к экзаменам на бесплатной и/или платной основе.</p>
            <p>2.2. Пользователь обязуется использовать материалы исключительно в личных образовательных целях.</p>

            <p><strong>3. ПРАВА И ОБЯЗАННОСТИ ПОЛЬЗОВАТЕЛЯ</strong></p>
            <p>3.1. Пользователь обязуется:</p>
            <ul>
                <li>Не предпринимать действия, способные нарушить работоспособность платформы.</li>
                <li>Не использовать материалы платформы в коммерческих целях без письменного разрешения администрации.</li>
                <li>Соблюдать авторские права на материалы, представленные на платформе.</li>
            </ul>
            <p>3.2. Пользователь несет ответственность за сохранность своих учетных данных и результаты своих действий на платформе.</p>

            <p><strong>4. ПРАВА И ОБЯЗАННОСТИ АДМИНИСТРАЦИИ</strong></p>
            <p>4.1. Администрация оставляет за собой право вносить изменения в функционал платформы без предварительного уведомления пользователей.</p>
            <p>4.2. Администрация обязуется соблюдать конфиденциальность предоставленных пользователями данных.</p>
            <p>4.3. Администрация имеет право временно приостанавливать доступ к платформе для проведения технических работ.</p>

            <p><strong>5. ОГРАНИЧЕНИЯ ОТВЕТСТВЕННОСТИ</strong></p>
            <p>5.1. Администрация не несет ответственности за:</p>
            <ul>
                <li>Ошибки в заданиях или пробниках, которые могут повлиять на результаты тестирования.</li>
                <li>Технические сбои, препятствующие доступу к платформе.</li>
                <li>Ущерб, причиненный пользователю в результате использования материалов платформы.</li>
            </ul>

            <p><strong>6. ИНТЕЛЛЕКТУАЛЬНАЯ СОБСТВЕННОСТЬ</strong></p>
            <p>6.1. Все материалы, включая текстовые и графические элементы, представленные на платформе, являются собственностью администрации или правообладателей.</p>
            <p>6.2. Любое использование материалов без предварительного письменного согласия администрации запрещено.</p>

            <p><strong>7. ИЗМЕНЕНИЕ УСЛОВИЙ</strong></p>
            <p>7.1. Администрация оставляет за собой право в любое время изменять условия настоящего соглашения.</p>
            <p>7.2. Продолжение использования платформы после изменения условий означает согласие пользователя с новой редакцией соглашения.</p>

            <p><strong>8. КОНФИДЕНЦИАЛЬНОСТЬ</strong></p>
            <p>8.1. Администрация обязуется обрабатывать персональные данные пользователей в соответствии с законодательством о защите персональных данных.</p>
            <p>8.2. Личные данные пользователей не передаются третьим лицам без их согласия.</p>

            <p><strong>9. ЗАКЛЮЧИТЕЛЬНЫЕ ПОЛОЖЕНИЯ</strong></p>
            <p>9.1. Настоящее соглашение регулируется законодательством Российской Федерации.</p>
            <p>9.2. Все споры, возникающие в связи с данным соглашением, разрешаются в судебном порядке.</p>
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
