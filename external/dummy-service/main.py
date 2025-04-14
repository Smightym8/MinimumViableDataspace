from fastapi import FastAPI
import databases
import sqlalchemy
import os

DATABASE_URL = os.getenv("DATABASE_URL")

if not DATABASE_URL:
    raise ValueError("DATABASE_URL environment variable not set")

database = databases.Database(DATABASE_URL)
metadata = sqlalchemy.MetaData()

measurement = sqlalchemy.Table(
    "measurement",
    metadata,
    sqlalchemy.Column("id", sqlalchemy.Integer, primary_key=True),
    sqlalchemy.Column("value", sqlalchemy.Numeric),
)

app = FastAPI()

@app.on_event("startup")
async def startup():
    await database.connect()

@app.on_event("shutdown")
async def shutdown():
    await database.disconnect()

@app.get("/api/v1/data")
async def get_data():
    query = measurement.select()
    results = await database.fetch_all(query)
    return results