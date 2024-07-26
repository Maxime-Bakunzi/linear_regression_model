from fastapi import FastAPI
from pydantic import BaseModel
import uvicorn
import numpy as np
import pandas as pd
import joblib

app = FastAPI()

# Load the pre-trained model
model = joblib.load('regressor_model.pkl')
class EmployeeData(BaseModel):
    Gender: int
    Age: int
    PhD: int


@app.post('/predict')
def predict(data: EmployeeData):
    input_data = np.array([[
        data.Gender, data.Age, data.PhD
    ]])

    prediction = model.predict(input_data)
    return {'prediction': prediction[0]}


# if __name__ == '__main__':
#     uvicorn.run(app, host='127.0.0.1', port=8000)
