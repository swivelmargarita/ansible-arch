#!/usr/bin/env python

import os
import sqlite3
import shutil
import time


def create_bookmarks():
    username = os.getlogin()
    places_path = "places.sqlite"
    db = sqlite3.connect(places_path)
    categories = [
        "Social", "Tech", "Work", "Research", "Health", "Education",
        "Tools", "Blogs", "Music", "Books", "Reference", "Learning",
        "Hobbies", "To Read", "Misc."
    ]
    for i, category in enumerate(categories):
        db.execute(f"INSERT INTO moz_bookmarks (type, title, position, parent)\
                     VALUES ('2', '{category}', '{i}', '3');")
    db.commit()
    db.close()
    shutil.copyfile("./places.sqlite", f"/home/{username}/.mozilla/firefox/{username}.default/places.sqlite")
    shutil.copyfile("./places.sqlite.original", "./places.sqlite")

def delete_previous_remembered_websites():
    username = os.getlogin()
    permission_path = f"/home/{username}/.mozilla/firefox/{username}.default/permissions.sqlite"
    db = sqlite3.connect(permission_path)
    db.execute("DELETE FROM moz_perms WHERE origin LIKE 'https://%' OR  origin LIKE 'http://%'")
    db.commit()
    db.close()
def add_remembered_websites():
    username = os.getlogin()
    websites = ["open.spotify.com", "twitter.com", "github.com", "gitlab.com", "web.whatsapp.com"]
    permission_path = f"/home/{username}/.mozilla/firefox/{username}.default/permissions.sqlite"
    db = sqlite3.connect(permission_path)
    for website in websites:
        db.execute(f"INSERT INTO moz_perms (origin, type,permission,expireType)\
                VALUES ('https://www.{website}', 'cookie', '1', '0');")
    db.commit()
    db.close()


if __name__ == "__main__":
    delete_previous_remembered_websites()
    add_remembered_websites()
    create_bookmarks()
