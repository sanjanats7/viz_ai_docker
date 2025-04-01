#!/bin/bash

echo "Welcome to VizAI Setup!"

# Prompt user for input
read -p "Enter Database Username: " db_user
read -p "Enter Database Password: " db_password
read -p "Enter Database Name: " db_name
read -p "Enter Google API Key: " google_api_key

# Generate .env file
cat <<EOL > .env
DB_USER=$db_user
DB_PASSWORD=$db_password
DB_HOST=db
DB_NAME=$db_name
DB_PORT=5432

SECRET_KEY=$(openssl rand -hex 32)
ALGORITHM=HS256
ACCESS_TOKEN_EXPIRE_MINUTES=120
REFRESH_TOKEN_EXPIRE_DAYS=30

LLM_URI=http://0.0.0.0:8003
LLM_MODEL=gemini-1.5-flash
DEFAULT_NUM_QUERIES=3

GOOGLE_API_KEY=$google_api_key
EOL

echo "✅ .env file created!"
echo "🚀 Starting VizAI..."
docker-compose up -d

