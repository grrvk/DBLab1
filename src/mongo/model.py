from datetime import datetime
import random
from random import randint
import string


class Ticket(object):
    def __init__(self, exhibition_name: str, name: str, surname: str, phone: str, email: str,
                 date: datetime, cost: int):
        self.exhibition_name = exhibition_name
        self.name = name
        self.surname = surname
        self.phone = phone
        self.email = email
        self.date = date
        self.cost = cost

    @property
    def date(self):
        return self.date

    @date.setter
    def date(self, value):
        if value is None:
            self.date = datetime.utcnow()


def generate_random() -> Ticket:
    ticket = Ticket('New_exh', ''.join(random.choices(string.ascii_lowercase, k=8)),
                    ''.join(random.choices(string.ascii_lowercase, k=8)),
                    ''.join(random.choices(string.digits, k=12)),
                    ''.join(random.choices(string.digits, k=15)),
                    datetime.utcnow(), randint(10, 30))
    return ticket
