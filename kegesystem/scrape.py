import aiohttp
import asyncio
from bs4 import BeautifulSoup
import sqlite3
import os
import time
from urllib.parse import urljoin

async def fetch(session, url):
    async with session.get(url) as response:
        return await response.text()

async def get_last_page(soup):
    """Определяет номер последней страницы, если есть ссылка 'aria-label=Next'."""
    next_button = soup.find('a', class_='page-link', attrs={'aria-label': 'Next'})
    if next_button is not None: 
        return int(next_button['href'].split('page=')[-1])
    return 1 

async def scrape_task(session, task_number, page, tasks_check):
    url = f"https://alex-math.ru/gia/egei{task_number}/?page={page}"
    text = await fetch(session, url)
    soup = BeautifulSoup(text, "lxml")
    titles = soup.find_all('h3', class_='post-title')
    fulltexts = soup.find_all('div', class_='post-fulltext')

    for title, fulltext in zip(titles, fulltexts):
        link = title.find('a')
        if link and link.has_attr('href'):
            href = link['href']
            if href not in tasks_check:
                tasks_check.add(href)
                new_text = await fetch(session, f'https://alex-math.ru/{href}')
                new_soup = BeautifulSoup(new_text, "lxml")
                post_fulltext = new_soup.find('div', class_='post-fulltext mt-4')
                if post_fulltext:
                    for img in post_fulltext.find_all('img'):
                        if img.has_attr('src'):
                            img['src'] = urljoin("https://alex-math.ru", img['src'])
                    level = "Авторские задачи"
                    if "статград" in title.prettify().lower():
                        level = "Усложненный экзамен"
                    elif "демо" in title.prettify().lower() \
                        or "егкр" in title.prettify().lower() \
                        or "резерв" in title.prettify().lower() \
                        or "основная волна" in title.prettify().lower():
                        level = "Реальный экзамен"
                    elif "поляков" in title.prettify().lower():
                        if "егэ-" in fulltext.prettify().lower():
                            level = "Реальный экзамен"
                        else:
                            level = "Авторские задачи"
                    insert_into_database(task_number, level, title.prettify(), 
                                         fulltext.prettify(), post_fulltext.prettify())

async def scrape(task_number):
    tasks_check = set()
    async with aiohttp.ClientSession() as session:
        # Определяем последнюю страницу
        first_page_url = f"https://alex-math.ru/gia/egei{task_number}/?page=1"
        first_page_text = await fetch(session, first_page_url)
        soup = BeautifulSoup(first_page_text, "lxml")
        last_page = await get_last_page(soup)
        print(task_number, last_page)
        # Парсим все страницы до последней
        for page in range(1, last_page + 1):
            await scrape_task(session, task_number, page, tasks_check)
        

def setup_database():
    if os.path.exists("education_system.db"):
        os.remove("education_system.db")
    conn = sqlite3.connect("education_system.db")
    cursor = conn.cursor()
    cursor.execute("""
        CREATE TABLE IF NOT EXISTS tasks (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            task_number TEXT,
            level TEXT,
            title TEXT,
            fulltext TEXT,
            solution TEXT
        )
    """)
    conn.commit()
    conn.close()

def insert_into_database(task_number, level, title, fulltext, solution):
    conn = sqlite3.connect("education_system.db")
    cursor = conn.cursor()
    cursor.execute("""
        INSERT INTO tasks (task_number, level, title, fulltext, solution)
        VALUES (?, ?, ?, ?, ?)
    """, (task_number, level, title, fulltext, solution))
    conn.commit()
    conn.close()

def parsing_tasks():
    setup_database()
    asyncio.run(main())

async def main():
    tasks = [scrape(f"{i:02}") for i in range(1, 27 + 1) if i not in (10, 20, 21)]
    await asyncio.gather(*tasks)

if __name__ == "__main__":
    start = time.time()
    parsing_tasks()
    print(f"Прошло времени в минутах: {(time.time() - start) / 60}")
