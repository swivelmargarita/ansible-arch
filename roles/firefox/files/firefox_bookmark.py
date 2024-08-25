#!/usr/bin/env python

import os, shutil, sqlite3


class Bookmark():
    def __init__(self, url="", title="", parent="") -> None:
        self.url = f"https://www.{url}"
        self.title = title
        self.parent = parent

def create_bookmarks():
    username = os.getlogin()
    places_path = "places.sqlite"
    db = sqlite3.connect(places_path)
    categories = [
        "Social", "Tech", "Work","Health", "Job",
        "Blogs", "Music", "Reference", 
        "Learning", "To Read", "Misc." ]
    for i, category in enumerate(categories):
        db.execute(f"INSERT INTO moz_bookmarks (type, title, position, parent)\
                     VALUES ('2', '{category}', '{i}', '3');")

    bookmarks = {"Music": [["open.spotify.com","Spotify"],
                          ["last.fm", "Last.fm"]
                          ],
                 "Social": [["twitter.com", "Twitter"],
                           ["web.whatsapp.com", "WhatsApp"],
                           ["youtube.com/feed/subscriptions", "YouTube"]
                           ],
                 "Tech": [["github.com", "GitHub"], 
                         ["gitlab.com", "GitLab"]
                         ],
                 "Job": [["hh.kz", "HeadHunter"],
                         ["linkedin.com", "LinkedIn"]
                         ],
                 "Blogs": [["news.ycombinator.com", "Hacker News"],
                          ["habr.com/ru/articles/top/daily/","Habr"],
                          ["blog.quastor.org", "Quastor - Tech Blog Summaries"],
                           ["blog.bytebytego.com", "ByteByteGo Blog"],
                           ["linuxjournal.com/recent", "Linux Journal"],
                           ["cyberciti.biz", "nixCraft"],
                           ["omgubuntu.co.uk", "OMG! Ubuntu"],
                           ["blogs.oracle.com/linux", "Oracle Linux Blog"],
                           ["fedoramagazine.org", "Fedora Magazine"],
                           ["lwn.net", "lwn"]
                     ],
                 "Misc.": [["rutracker.net", "rutracker"],
                           ["rutracker.net", "rutracker"],
                           ],
                 "Reference": [["wiki.archlinux.org", "ArchWiki"]
                     ]
                 }
    for category, websites in bookmarks.items():
        for website in websites:
            db.execute(f"INSERT INTO moz_places (url, title, foreign_count)\
                    VALUES('{website[0]}', '{website[1]}', '1');")
            db.execute(f"INSERT INTO moz_bookmarks (type, fk, parent, title)\
                    VALUES('1', (SELECT id FROM moz_places WHERE title = '{website[1]}'),\
                                (SELECT id FROM moz_bookmarks WHERE title = '{category}'),\
                                '{website[1]}');")
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
