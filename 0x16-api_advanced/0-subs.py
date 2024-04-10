#!/usr/bin/python3
"""
Find the number of subreddit threads
"""
import requests


def number_of_subscribers(subreddit):
    """
    Getting the number of subscribers
    """
    url = f"https://www.reddit.com/r/{subreddit}/about.json"
    headers = {"User-Agent": "Mozilla/5.0"}
    response = requests.get(url, headers=headers)

    if response.status_code == 200:
        data = response.json()
        if 'data' in data and 'subscribers' in data['data']:
            subscribers = data['data']['subscribers']
            return subscribers
        else:
            return 0
    elif response.status_code == 404:
        return 0
    else:
        return 0
