from fastapi import FastAPI, Query
from fastapi.responses import FileResponse
import sys
import uvicorn

app = FastAPI()

@app.get("/")
def read_root():
    return {"Hello": "Anph"}

if __name__ == "__main__":
    uvicorn.run("main:app", host="0.0.0.0", port=80, log_level="info", access_log=True)
