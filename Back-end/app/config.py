import os
from pydantic_settings import BaseSettings
from logging import DEBUG, getLogger, basicConfig, FileHandler, Formatter, Logger

base_dir = os.path.dirname(os.path.abspath(__file__))
log_dir = os.path.join(base_dir, "../logs")

# Crear el directorio logs si no existe
os.makedirs(log_dir, exist_ok=True)

"""LOGGING CONFIG"""
log_format = "%(asctime)s:%(levelname)s:%(name)s:%(message)s"

def create_logger(level: str):
    level_upper = level.upper()
    file_handler = FileHandler(f"{log_dir}/{level_upper}.log")
    file_handler.setFormatter(Formatter(log_format))
    logger = getLogger(f"{level}_logger")
    logger.setLevel(level_upper)
    logger.addHandler(file_handler)

# GENERAL LOGS (ALL)
getLogger().setLevel(DEBUG)
basicConfig(filename=os.path.join(log_dir, "GENERAL.log"), level=DEBUG, format=log_format)
# ERROR LOGS
create_logger("error")
# INFO LOGS
create_logger("info")
"""END LOGGING CONFIG"""

class Settings(BaseSettings):
    db_server: str
    db_name: str
    db_user: str
    db_password: str

    error_logger: Logger = getLogger("error_logger")
    info_logger: Logger = getLogger("info_logger")

    class Config:
        case_sensitive = True
        env_file = ".env"

APP_CONFIG = dict(
    title="Prueba",
    contact={
        "name": "Manuel Martinez",
    },
    openapi_tags=[
        {
            "name": "Libros",
            "description": "Operaciones con libros",
        }
    ],
)
