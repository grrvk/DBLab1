import pymongo
from pymongo import MongoClient
from pymongo.database import Database

from config import settings

client = MongoClient(f"mongodb://{settings.mongo_user}:"
                     f"{settings.mongo_password}@{settings.mongo_host}:{settings.mongo_port}/{settings.mongo_db}")
db = client[settings.mongo_db]


def get_db() -> Database:
    return db
