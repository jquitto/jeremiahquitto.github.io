#!/usr/bin/env python3
# NOTE: requests is optional here; leaving as an example.
import os
import urllib.request

URL = os.getenv("URL", "http://localhost:8080/health")
TIMEOUT = int(os.getenv("TIMEOUT", "2"))

try:
    with urllib.request.urlopen(URL, timeout=TIMEOUT) as resp:
        print(resp.status)
        exit(0 if resp.status == 200 else 2)
except Exception as e:
    print(e)
    exit(3)
