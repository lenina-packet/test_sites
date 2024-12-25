import sqlite3
import random

def get_variant():
    conn = sqlite3.connect("education_system.db")
    cursor = conn.cursor()

    # Получить все данные по заданиям, исключая номер 10
    cursor.execute("""
        SELECT task_number, id, fulltext, solution 
        FROM tasks 
        WHERE task_number != 10
    """)
    tasks = cursor.fetchall()
    conn.close()

    # Разбиваем задания по номерам
    tasks_by_number = {}
    for task_number, task_id, fulltext, solution in tasks:
        if task_number in [19, 20, 21]:
            task_number = "19-21" 
        tasks_by_number.setdefault(task_number, []).append({
            "id": task_id,
            "fulltext": fulltext,
            "solution": solution,
        })

    # Генерация случайного варианта
    variant = {}
    for task_number, task_data in tasks_by_number.items():
        variant[task_number] = random.choice(task_data)  # Выбираем случайное задание

    return variant