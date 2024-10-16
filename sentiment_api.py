from fastapi import FastAPI
from pydantic import BaseModel
from transformers import pipeline

# Initialize the FastAPI app
app = FastAPI()

# Load a specific pre-trained sentiment analysis model
sentiment_pipeline = pipeline("sentiment-analysis", model="distilbert-base-uncased-finetuned-sst-2-english")

# Define input data schema
class InputText(BaseModel):
    text: str

# Define a prediction endpoint
@app.post("/sentiment/")
async def analyze_sentiment(input_data: InputText):
    result = sentiment_pipeline(input_data.text)
    return {"sentiment": result[0]['label'], "confidence": result[0]['score']}

# Health check endpoint
@app.get("/")
def read_root():
    return {"message": "Sentiment Analysis API is running!"}
