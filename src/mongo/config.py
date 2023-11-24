import os


class Settings:
    mongo_host: str = os.getenv("MONGO_HOST")
    mongo_port: int = os.getenv("MONGO_PORT")
    mongo_user: str = os.getenv("MONGO_USER")
    mongo_password: int = os.getenv("MONGO_PASSWORD")
    mongo_db: str = os.getenv("MONGO_DATABASE")


settings = Settings()
