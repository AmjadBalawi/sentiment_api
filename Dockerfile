# Use the official Python image from Docker Hub
FROM python:3.11-slim

# Set the working directory
WORKDIR /app

# Copy the requirements file into the container
COPY requirements.txt .

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt || (cat /root/.cache/pip/log/debug.log && exit 1)

# Copy the rest of your application code into the container
COPY . .

# Command to run your FastAPI app with Uvicorn
CMD ["uvicorn", "sentiment_api:app", "--host", "0.0.0.0", "--port", "8080"]
