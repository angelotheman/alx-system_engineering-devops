#!/usr/bin/python3
"""
Gathering data from an API using the requests module
"""
import requests
from sys import argv


def fetch_todo_progress(employee_id):
    """Get's the exact resource for the employee id"""
    url = f"https://jsonplaceholder.typicode.com/todos?userId={employee_id}"
    response = requests.get(url)
    return response.json()


def display_tasks(employee_id):
    """Display's the completed tasks of the user"""
    tasks_data = fetch_todo_progress(employee_id)
    num_of_tasks = len(tasks_data)
    completed_tasks = sum(task['completed'] for task in tasks_data)
    return completed_tasks, num_of_tasks


def fetch_user(employee_id):
    """Gets the user associated witht the resource"""
    url = f"https://jsonplaceholder.typicode.com/users/{employee_id}"
    response = requests.get(url)
    user_data = response.json()
    name = user_data.get('name')
    return name


if __name__ == '__main__':
    employee_id = argv[1]
    complete_task, sum_tasks = display_tasks(employee_id)
    user = fetch_user(employee_id)

    print(f"Employee {user} is done with tasks({complete_task}/{sum_tasks}):")
    for task in fetch_todo_progress(employee_id):
        if task['completed']:
            print(f"\t {task['title']}")
