FROM python:3.9-slim

WORKDIR /app

# Install Python dependencies
COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

# Copy source files
COPY . .

# Make sure static directory exists
RUN mkdir -p static

# Expose port for Flask
EXPOSE 5000

# Run the app using gunicorn
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]
