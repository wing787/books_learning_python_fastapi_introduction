from fastapi import FastAPI

app = FastAPI()

@app.get('/Hello')
async def hello():
    return {'message': 'Hello World!'}