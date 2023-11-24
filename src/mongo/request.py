from datetime import datetime

from database import db
from model import generate_random, Ticket
import time

tickets = db.tickets


def insert_one_ticket(count):
    start = time.time()
    for i in range(0, count):
        ticket = generate_random()
        tickets.insert_one(ticket.__dict__)
    end = time.time()
    print(f"Function takes {end - start} seconds")


def insert_many_ticket(count):
    total_dict = []
    for i in range(0, count):
        ticket = generate_random().__dict__
        total_dict.append(ticket)
    start = time.time()
    db.tickets.insert_many(total_dict)
    end = time.time()
    print(f"Function takes {end - start} seconds")


insert_one_ticket(20000)
insert_many_ticket(20000)
