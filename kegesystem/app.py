import sqlite3
from flask import Flask, render_template, request, send_from_directory, redirect, url_for
from viz import viz_found_tasks
from edu_system import get_variant
from scrape import parsing_tasks

app = Flask(__name__)

def create_connection(db_file):
    conn = sqlite3.connect(db_file)
    return conn

def get_tasks_info():
    conn = sqlite3.connect("education_system.db")
    cursor = conn.cursor()
    cursor.execute("SELECT COUNT(*) FROM tasks")
    total_tasks = cursor.fetchone()[0]
    cursor.execute("SELECT task_number, COUNT(*) FROM tasks GROUP BY task_number")
    tasks_by_number = cursor.fetchall()

    result = {
        "total_tasks": total_tasks,
        "tasks_by_number": {task_number: count for task_number, count in tasks_by_number}
    }
    conn.close()
    return result

@app.route('/static/<path:filename>')
def send_static(filename):
    return send_from_directory('static', filename)

@app.route('/test', methods=['GET', 'POST'])
def test():
    variant = get_variant()
    return render_template('test.tpl', variant=variant)

@app.route('/agreement')
def agreement():
    return render_template('agreement.tpl')

@app.route('/contacts')
def instructions():
    return render_template('contacts.tpl')

@app.route('/update_tasks', methods=['POST'])
def update_tasks(): 
    return redirect(url_for('index'))  

# Главная страница
@app.route('/')
def index():
    tasks_info = get_tasks_info()
    tasks = list(tasks_info['tasks_by_number'].items())
    total_tasks_part1 = tasks[:len(tasks)//2]
    total_tasks_part2 = tasks[len(tasks)//2:]
    print(total_tasks_part1)
    viz_found_tasks()
    return render_template('index.tpl', 
                           total_tasks=tasks_info['total_tasks'], 
                           total_tasks_part1=total_tasks_part1,
                           total_tasks_part2=total_tasks_part2)

if __name__ == '__main__':
    app.run(host='localhost', port=8080, debug=True)
