#!/usr/bin/env python


import os
import sqlite3
from pathlib import Path
import shutil

username = os.getlogin()

places_path = "places.sqlite"
db = sqlite3.connect(places_path)

categories = [
    "Social",
    "Tech",
    "Work",
    "Research",
    "Health",
    "Education",
    "Tools",
    "Blogs",
    "Music",
    "Books",
    "Reference",
    "Learning",
    "Hobbies",
    "To Read",
    "Misc."
]
for i, category in enumerate(categories):
    db.execute(f"INSERT INTO moz_bookmarks (type, title, position, parent)\
                 VALUES ('2', '{category}', '{i}', '3');")

print(*db.execute("SELECT title FROM moz_bookmarks ;").fetchall())
db.commit()
db.close()
shutil.copyfile("./places.sqlite", f"/home/{username}/.mozilla/firefox/{username}.default/places.sqlite")
shutil.copyfile("./places.sqlite.original", "./places.sqlite")
