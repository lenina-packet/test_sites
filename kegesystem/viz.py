import matplotlib.pyplot as plt
from matplotlib import font_manager as fm
import sqlite3

font_path = "static/fonts/TTFirsNeue-Medium.ttf"
prop = fm.FontProperties(fname=font_path)

def viz_found_tasks():
    conn = sqlite3.connect("education_system.db")
    cursor = conn.cursor()
    cursor.execute("SELECT level, COUNT(*) FROM tasks GROUP BY level")
    tasks_by_level = cursor.fetchall()
    conn.close()

    levels = [row[0] for row in tasks_by_level] 
    counts = [row[1] for row in tasks_by_level] 

    # Настройка диаграммы
    plt.figure(figsize=(8, 8), dpi=300)
    plt.pie(
        counts,
        labels=levels,
        autopct='%1.1f%%',
        startangle=140,
        colors=plt.cm.Paired.colors,
        textprops={'fontsize': 10, 'fontproperties': prop},  # Локальный шрифт для подписей
    )
    plt.title("Распределение задач по уровням", fontsize=14, fontproperties=prop, pad=20)
    plt.axis('equal')  # Круг правильной формы

    # Убираем фон и сохраняем в SVG
    plt.gcf().set_facecolor("none")  # Удаление фона
    plt.savefig("static/tasks_distribution.svg", format="svg", transparent=True)

# get_tasks_info()