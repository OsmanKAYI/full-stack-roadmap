# PyTorch and Machine Learning

## Overview of PyTorch

PyTorch is an open-source deep learning library developed by Facebook (Meta) that is widely utilized in both academic and industrial settings due to its flexibility and ease of use. It allows for dynamic computation graphs, automatic differentiation, and GPU support, making it a powerful tool for machine learning practitioners.

### Key Features

- **Dynamic Computation Graphs:** Enables the creation and modification of graphs during model execution.
- **Automatic Differentiation:** Automatically computes gradients using the `torch.autograd` module.
- **GPU Support:** Facilitates operations accelerated by CUDA.
- **Modular Structure:** Easily extensible and customizable with various libraries like TorchVision for image processing and TorchText for text data.

## Example: Simple Neural Network

A simple neural network can be created and trained using PyTorch. The process involves data generation, model definition, loss function selection, and an optimization loop to minimize the loss.

## Example Code: Creating and Training a Simple Neural Network

```python
import torch
import torch.nn as nn
import torch.optim as optim

# Data generation
x = torch.randn(100, 1)  # 100 samples, 1 feature
y = 3 * x + torch.randn(100, 1) * 0.5  # Simple linear relationship

# Model definition
class LinearRegressionModel(nn.Module):
    def __init__(self):
        super(LinearRegressionModel, self).__init__()
        self.linear = nn.Linear(1, 1)

    def forward(self, x):
        return self.linear(x)

model = LinearRegressionModel()

# Loss function and optimizer
criterion = nn.MSELoss()
optimizer = optim.SGD(model.parameters(), lr=0.01)

# Training loop
for epoch in range(1000):
    optimizer.zero_grad()
    predictions = model(x)
    loss = criterion(predictions, y)
    loss.backward()
    optimizer.step()

    if epoch % 100 == 0:
        print(f"Epoch {epoch}, Loss: {loss.item()}")

# Predictions from the trained model
with torch.no_grad():
    test_x = torch.tensor([[4.0]])
    print("Prediction:", model(test_x).item())
```

## Anomaly Detection in Ticket Sales System

PyTorch can be applied to detect anomalies in ticket sales data. While it is suitable for complex datasets, simpler alternatives like Scikit-Learn may suffice for less complicated scenarios.

### Recommended Approaches

1. **Using PyTorch:** Best for large datasets and deep learning models.
2. **Alternatives:** Scikit-Learn for classic machine learning, and statistical methods for smaller datasets.

### Example Code for Anomaly Detection

1. **Simple Statistical Method:**

   ```python
   from scipy.stats import zscore
   import pandas as pd

   # Load and analyze data
   df = pd.read_csv("sales_data.csv")
   df['z_score'] = zscore(df['sale_amount'])
   anomalies = df[df['z_score'].abs() > 3]
   ```

2. **Anomaly Detection with Machine Learning:**

   ```python
   from sklearn.ensemble import IsolationForest

   model = IsolationForest(contamination=0.01)
   df['anomaly_score'] = model.fit_predict(df)
   anomalies = df[df['anomaly_score'] == -1]
   ```

3. **Supervised Learning Approach:**

   ```python
   from sklearn.ensemble import RandomForestClassifier
   from sklearn.model_selection import train_test_split

   X = df.drop(['is_ok'], axis=1)
   y = df['is_ok']
   X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=0.2)

   model = RandomForestClassifier()
   model.fit(X_train, y_train)
   predictions = model.predict(X_test)
   ```

## Working with Large Datasets

Even without extensive knowledge of PyTorch or statistics, meaningful insights can be derived from large datasets (e.g., 4 million rows) using basic programming skills. Techniques include simple statistical methods, machine learning for anomaly detection, and supervised learning approaches to classify data effectively.

By leveraging these methods, practitioners can identify anomalies and extract valuable insights from their data.
