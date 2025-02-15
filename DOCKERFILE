# Use an official lightweight Python image
FROM python:3.9-slim

# Set the working directory inside the container
WORKDIR /app

# Copy all project files into the container
COPY . .

# Install system dependencies and Python packages
RUN apt-get update && apt-get install -y git curl && rm -rf /var/lib/apt/lists/*
RUN pip install --no-cache-dir fastapi uvicorn openai requests sqlite3 duckdb

# Expose port 8000 for FastAPI
EXPOSE 8000

# Command to start FastAPI
CMD ["uvicorn", "Automation_Api:app", "--host", "0.0.0.0", "--port", "8000"]
