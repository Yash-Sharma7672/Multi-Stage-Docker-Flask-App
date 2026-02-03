# -------- Stage 1: Build Stage --------
FROM python:3.11-slim AS build

# Set work directory
WORKDIR /app

# INstall build dependencies
RUN apt-get update && apt-get install -y --no-install-recommends gcc build-essential \
    && rm -rf /var/lib/apt/lists/*

# Copy requirements and install dependencies to a separate folder
COPY app/requirements.txt .
RUN pip install --prefix=/install-deps --no-cache-dir -r requirements.txt

# Copy application code
COPY app/ .

# -------- Stage 2: Production Stage --------
FROM python:3.11-slim AS production

# Set work directory
WORKDIR /app

# Copy only installed dependencies from build stage
COPY --from=build /install-deps /usr/local

# Copy application code
COPY --from=build /app /app

# Create non-root user for security
RUN useradd -m flaskuser
USER flaskuser

# Expose port
EXPOSE 5000

# Run Gunicorn server
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "main:app"]
