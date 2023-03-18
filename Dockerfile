# Use an official Python runtime as a parent image
FROM python:3.8-slim-buster

# Set the working directory to /app
WORKDIR /app

# Copy the requirements file into the container at /app
COPY requirements.txt /app/

# Install any needed packages specified in requirements.txt
RUN apt-get update && \
    apt-get install -y --no-install-recommends \
    postgresql-client && \
    rm -rf /var/lib/apt/lists/* && \
    pip install --trusted-host pypi.python.org -r requirements.txt

# Copy the rest of the application code into the container at /app
COPY . /app/

# Expose the port the application will run on
EXPOSE 8000

# Define environment variable
ENV NAME World

# Run the command to start the Django app
CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]
