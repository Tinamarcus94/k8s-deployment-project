# Use a lightweight Python base image
FROM python:3.9-slim

# Set working directory
WORKDIR /app

# Copy application files
COPY app.py /app

# Install Flask
RUN pip install flask

# Expose port 80
EXPOSE 80

# Run the application
CMD ["python", "app.py"]
