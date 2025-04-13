FROM python:3.9

WORKDIR /app

# Copy necessary files
COPY requirements.txt .
COPY app.py .
COPY zip/House_price_prediction.pkl ./zip/
COPY templates ./templates  

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Expose port
EXPOSE 5001

# Run Flask app
CMD ["flask", "run", "--host=0.0.0.0", "--port=5001"]
