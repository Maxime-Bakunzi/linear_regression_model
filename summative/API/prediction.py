from fastapi import FastAPI
from pydantic import BaseModel
import numpy as np
import pandas as pd
import joblib

app = FastAPI()

# Load the pre-trained model
model = joblib.load('regressor_model.pkl')
scaler = joblib.load('scaler.pkl')

class EmployeeData(BaseModel):
    Gender: int
    Age: int
    PhD: int


@app.post('/predict')
def predict(data: EmployeeData):
    input_data = np.array([[
        data.Gender, data.Age, data.PhD
    ]])

    data_scaled = scaler.transform(input_data)

    prediction = model.predict(data_scaled)
    return {'prediction': prediction[0]}
