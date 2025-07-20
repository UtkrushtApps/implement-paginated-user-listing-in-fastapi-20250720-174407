# syntax=docker/dockerfile:1
FROM python:3.11-slim AS base

ENV VENV_PATH="/opt/venv"

# Create virtual environment inside the container to satisfy policy
RUN python -m venv "$VENV_PATH"
ENV PATH="$VENV_PATH/bin:$PATH"

# Install dependencies inside the virtual environment
COPY requirements.txt /tmp/requirements.txt
RUN pip install --no-cache-dir -r /tmp/requirements.txt

# Copy application code
COPY app /app
WORKDIR /app

EXPOSE 8000

CMD ["uvicorn", "main:app", "--host", "0.0.0.0", "--port", "8000"]
