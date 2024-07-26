# Salary Prediction App

This project is a Salary Prediction App built using Flutter for the frontend and FastAPI for the backend. The app predicts an employee's salary based on their gender, age, and PhD status using a Multiple Linear Regression model.

## Table of Contents

- [Overview](#overview)
- [Features](#features)
- [Architecture](#architecture)
- [Dataset](#dataset)
- [Model](#model)
- [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Backend Setup](#backend-setup)
  - [Frontend Setup](#frontend-setup)
- [Usage](#usage)
- [Evaluation](#evaluation)

## Overview

The Salary Prediction App allows users to input their gender, age, and PhD status to predict their potential salary. The app is built with a user-friendly interface and leverages a trained multiple linear regression model to provide predictions.

## Features

- Input fields for gender, age, and PhD status
- Predict button to get salary prediction
- Visual display of the predicted salary
- Backend API built with FastAPI for prediction
- Linear regression model trained and evaluated

## Architecture

- **Frontend**: Built with Flutter
- **Backend**: Built with FastAPI, deployed on Render
- **Model**: Multiple Linear Regression using scikit-learn

## Dataset

The dataset used for training the model is `Employee_Salaries.csv`, which includes the following features:
- `Gender`: Binary variable (0 for Female, 1 for Male)
- `Age`: Age of the employee
- `PhD`: Binary variable (0 for no PhD, 1 for PhD)
- `Salary`: Salary of the employee

## Model

The model used is a Multiple Linear Regression model. It has been trained using the dataset mentioned above and evaluated using various metrics.

### Model Evaluation

- **R² Score**: Measures the proportion of the variance in the dependent variable that is predictable from the independent variables.
- **Mean Absolute Error (MAE)**: The average of the absolute errors.
- **Mean Squared Error (MSE)**: The average of the squared errors.
- **Root Mean Squared Error (RMSE)**: The square root of the average of squared errors.

## Setup

### Prerequisites

- Python 3
- Flutter SDK
- FastAPI
- Render account

### Backend Setup

1. Clone the repository:
    ```sh
    git clone https://github.com/Maxime-Bakunzi/linear_regression_model
    cd linear_regression_model/API
    ```

2. Create a virtual environment and activate it:
    ```sh
    python -m venv env
    source env/bin/activate  # On Windows use `env\Scripts\activate`
    ```

3. Install the required packages:
    ```sh
    pip install -r requirements.txt
    ```

4. Run the FastAPI server locally:
    ```sh
    uvicorn prediction:app --reload
    ```

5. Deploy the FastAPI server on Render following their deployment guidelines.

### Frontend Setup

1. Navigate to the frontend directory:
    ```sh
    cd linear_regression_model/salary_predictor
    ```

2. Install Flutter dependencies:
    ```sh
    flutter pub get
    ```

3. Run the Flutter app:
    ```sh
    flutter run
    ```

## Usage

1. Open the app on your device.
2. Input your gender (0 for Female, 1 for Male), age, and PhD status (0 for no PhD, 1 for PhD).
3. Click the "Predict" button.
4. View the predicted salary displayed on the screen.

## Evaluation

The model is evaluated using the R² Score, MAE, MSE, and RMSE metrics. Visualization of the results includes scatter plots of actual vs predicted salaries and residual plots to analyze the performance.
