# Base image
FROM python:3.11-slim as base

# Set working directory
WORKDIR /app

# Copy only the requirements file first
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application code
COPY . .

# Run the application
CMD ["uvicorn", "sentiment_api:app", "--host", "0.0.0.0", "--port", "3000"]
