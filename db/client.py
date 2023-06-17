from pymongo import MongoClient
import psycopg2

# Base de datos Remota desde MongoAtlas
db_client = MongoClient(
    "mongodb+srv://").eventos


# Base de datos Local desde Docker Postgresql
conn = psycopg2.connect(
    host="127.0.0.1",
    port="5423",
    database="politecnico",
    user="root",
    password="root"
)
