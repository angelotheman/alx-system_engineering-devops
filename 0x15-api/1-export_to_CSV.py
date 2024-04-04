#!/usr/bin/python3
"""
Gathering data from an API using the requests module
Put this data into a csv file
"""
import csv
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
    name = user_data.get('username')
    return name


if __name__ == '__main__':
    employee_id = argv[1]
    complete_task, total_tasks = display_tasks(employee_id)
    user = fetch_user(employee_id)

    filename = f"{employee_id}.csv"

    with open(filename, 'w', newline='') as csv_file:
        fieldnames = ['USER_ID', 'USERNAME',
                      'TASK_COMPLETED_STATUS', 'TASK_TITLE']
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)

        for task in fetch_todo_progress(employee_id):
            writer.writerow({
                'USER_ID': employee_id,
                'USERNAME': user,
                'TASK_COMPLETED_STATUS': task['completed'],
                'TASK_TITLE': task['title']
                })
