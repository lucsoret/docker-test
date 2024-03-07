from fastapi import FastAPI

app = FastAPI()


@app.get("/")
def read_root():
    return {"Hello": "From the cloud! and beyond the sky is the limite yolo"}
