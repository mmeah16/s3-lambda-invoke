from fastapi import FastAPI
from mangum import Mangum

app = FastAPI()

@app.get("/")
async def root():
    return {"Hello" : "World"}

@app.get("/users")
async def root():
    return {"Users" : "John Doe"}

handler = Mangum(app)