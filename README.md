# Salary Prediction App

## Overview

The Salary Prediction App is an innovative tool that leverages machine learning to predict an employee's salary based on key factors such as gender, age, and PhD status. Built with Flutter for the frontend and FastAPI for the backend, this app demonstrates the practical application of Multiple Linear Regression in real-world scenarios.

## Table of Contents

- [Features](#features)
- [Architecture](#architecture)
- [Dataset](#dataset)
- [Model](#model)
- [Setup](#setup)
  - [Prerequisites](#prerequisites)
  - [Backend Setup](#backend-setup)
  - [Frontend Setup](#frontend-setup)
- [Usage](#usage)
- [Model Evaluation](#model-evaluation)

## Features

- **User-Friendly Interface**: Intuitive input fields for gender, age, and PhD status.
- **Real-Time Prediction**: Instantly calculate salary predictions with a single tap.
- **Visual Results**: Clear and visually appealing display of the predicted salary.
- **Robust Backend**: Powered by FastAPI, ensuring fast and reliable predictions.
- **Advanced ML Model**: Utilizes a Multiple Linear Regression model for accurate predictions.

## Architecture

Our app follows a modern, scalable architecture:

- **Frontend**: 
  - Framework: Flutter
  - Language: Dart
  - Key Features: Cross-platform compatibility, rich UI components

- **Backend**: 
  - Framework: FastAPI
  - Language: Python
  - Deployment: Render
  - Key Features: Asynchronous request handling, automatic API documentation

- **Machine Learning**:
  - Library: scikit-learn
  - Model: Multiple Linear Regression
  - Key Features: Efficient training, easy integration with FastAPI

## Dataset

The model is trained on the `Employee_Salaries.csv` dataset, which includes:

| Feature | Description | Type |
|---------|-------------|------|
| Gender  | Employee's gender | Binary (0: Female, 1: Male) |
| Age     | Employee's age | Integer |
| PhD     | PhD status | Binary (0: No PhD, 1: PhD) |
| Salary  | Employee's salary | Float |

## Model

We use a Multiple Linear Regression model, chosen for its interpretability and efficiency in capturing linear relationships between features and the target variable (salary).

### Model Evaluation Metrics

- **R² Score**: Indicates the proportion of variance in the dependent variable predictable from the independent variables.
- **Mean Absolute Error (MAE)**: Average absolute difference between predicted and actual values.
- **Mean Squared Error (MSE)**: Average squared difference between predicted and actual values.
- **Root Mean Squared Error (RMSE)**: Square root of MSE, providing an error metric in the same unit as the target variable.

## Setup

### Prerequisites

- Python 3.7+
- Flutter SDK 2.0+
- FastAPI
- Render account (for backend deployment)

### Backend Setup

1. Clone the repository:
   ```sh
   git clone https://github.com/Maxime-Bakunzi/linear_regression_model
   cd linear_regression_model/API
   ```

2. Set up a virtual environment:
   ```sh
   python -m venv env
   source env/bin/activate  # On Windows use `env\Scripts\activate`
   ```

3. Install dependencies:
   ```sh
   pip install -r requirements.txt
   ```

4. Run the FastAPI server locally:
   ```sh
   uvicorn prediction:app --reload
   ```

5. Deploy to Render following their [Python deployment guide](https://render.com/docs/deploy-python-app).

### Frontend Setup

1. Navigate to the frontend directory:
   ```sh
   cd linear_regression_model/salary_predictor
   ```

2. Install Flutter dependencies:
   ```sh
   flutter pub get
   ```

3. Run the app:
   ```sh
   flutter run
   ```

## Usage

1. Launch the app on your device or emulator.
2. Input your details:
   - Gender (0 for Female, 1 for Male)
   - Age
   - PhD status (0 for no PhD, 1 for PhD)
3. Tap the "Predict" button.
4. View your predicted salary.

## Model Evaluation

We rigorously evaluate our model using:

- Scatter plots of actual vs. predicted salaries
- Residual plots for error analysis
- Detailed metrics including R², MAE, MSE, and RMSE

For a deep dive into our model's performance, check out the `multivariate.ipynb` notebook in the repository.
