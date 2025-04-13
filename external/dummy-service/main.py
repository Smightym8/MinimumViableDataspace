from fastapi import FastAPI

app = FastAPI()

@app.get("/api/v1/data")
def get_data():
    return "Hello World from dummy service"