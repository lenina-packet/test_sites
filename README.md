# kege_system
Веб-приложение для прохождения тренировочных вариантов, созданных на основе спарсенных заданий с сайта alex-math.ru
Оно позволяет создавать базу с заданиями из КИМ ЕГЭ по Информатике, а далее генерировать варианты для прохождения пробников.

# Стек инструментов для создания веб-приложения:
- [x] Backend: Flask
- [x] Frontend: HTML + CSS + JS
- [x] БД: SQlite
- [x] Скраппинг данных: BeautifulSoup

# Описание возможностей проекта:
## 1. Скраппинг заданий
- Все задания парсятся с сайта <https:/alex-math.ru>, далее скрапятся решения к заданиям, а также задания распределяются по уровням сложности.


## 2. Визуализация данных:
- На главной странице проекта можно увидеть визуализацию текущей ситуации в базе заданий. Показывается круговая диаграмма, а также статистика по количествам заданий.
- ![image](https://github.com/user-attachments/assets/36b38d9d-be81-4ad4-adae-00514d974719)
- ![image](https://github.com/user-attachments/assets/d69c0713-3afc-4e2b-b2f8-861507170f9d)

## 3. Прохождение варианта:
- Далее нажав на кнопку или перейдя через навигационное меню попадаем на странице с сгенерированным вариантом.
- Пользователь решает задание, далее открывает решение и оценивает себя.
- После завершения теста по инициативе пользователя или истечению таймера, на экране можно увидеть результаты.
- ![image](https://github.com/user-attachments/assets/857e2d45-0763-4733-bc03-d65f68fd3c18)
- ![image](https://github.com/user-attachments/assets/45b4400b-a4c2-4841-9d1d-6d4807483910)
- ![image](https://github.com/user-attachments/assets/ea4e83a2-7a0a-485e-99a4-fcc575cbd78e)
- ![image](https://github.com/user-attachments/assets/4aab8fe8-2723-4bf1-96cf-486255548fd7)

## 4. Остальные страницы:
- Далее на других страницах можно ознакомиться с лицензионным соглашением и контактными данными.
- ![image](https://github.com/user-attachments/assets/b9fc4854-15b7-4f30-9abc-7f5303713120)
- ![image](https://github.com/user-attachments/assets/87fb18ae-1540-4f21-8b04-dcd55630fcc0)
- ![image](https://github.com/user-attachments/assets/50f872df-38bb-4922-8e82-7221d6f96c61)

# Запуск проекта:

## Требования:
- [x] Python: 3.12.0

## Шаги:

1. Клонируйте репозиторий: `git clone https://github.com/lenina-packet/kege_system.git`
2. Перейдите в папку с app.py: 
  `pip install -r requirements.txt`
  `python app.py`
3. Получите готовый проект, перейдите по ссылке <http://localhost:8080>, где попадете на главную страницу.

# Docker :(:
Никак не смог уж поставить Docker, как только не пытался, все равно получаю ошибку, что у меня якобы не включена виртуализация, уже и БИОС смотрел, и службы шерестил, ничего не помогло...
