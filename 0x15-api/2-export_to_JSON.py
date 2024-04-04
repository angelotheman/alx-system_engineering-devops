#!/usr/bin/python3
"""
Gathering data from an API using the requests module
"""
import json
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
    completed_tasks = [{
        "task": task["title"],
        "completed": task["completed"],
        "username": fetch_user(employee_id)}
        for task in tasks_data]
    return completed_tasks


def fetch_user(employee_id):
    """Gets the user associated witht the resource"""
    url = f"https://jsonplaceholder.typicode.com/users/{employee_id}"
    response = requests.get(url)
    user_data = response.json()
    name = user_data.get('username')
    return name


if __name__ == '__main__':
    employee_id = argv[1]
    tasks = display_tasks(employee_id)
    user = fetch_user(employee_id)
    filename = f"{employee_id}.json"

    data = {employee_id: tasks}

    with open(filename, 'w') as json_file:
        json.dump(data, json_file)
