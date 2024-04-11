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
    response = requests.get(url, headers=headers, allow_redirects=False)

    if response.status_code == 404:
        return 0
    results = response.json().get("data")
    return results.get("subscribers")
