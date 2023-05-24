# Use an official Python runtime as the base image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the requirements file and install dependencies
COPY requirements.txt .
RUN pip install --no-cache-dir -r requirements.txt

# Copy the Flask application code into the container
COPY app.py .

# Expose the port that the Flask application will run on
EXPOSE 5000

# Set the command to run the Flask application
CMD ["python", "app.py"]