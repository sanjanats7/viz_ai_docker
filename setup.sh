#!/bin/bash

echo "Enter database username:"
read DB_USER

echo "Enter database password:"
read -s DB_PASSWORD   # -s hides input

echo "Enter database name:"
read DB_NAME

echo "Enter Google API Key (optional):"
read GOOGLE_API_KEY


SECRET_KEY="cff484365ab66a76a6ca6ccaa6aee69b0a6137fa1f9528a2e9df50da0f70b7828ce6642d03e40287c0aac084662b6217606bb167343c4558d28c1461ceb8d204ac37714d5914d498aaad7118fc4707a7758d9b379a9685ecefcfa3fe758dc77e9eed5125af76dc6723d4a88bbb9858a1fae65ca698bf959837c17f458187624437a84fa1db6cb435dc1f819aa9621baf72a511cbffbec6bcb6c54a6f026a6b675245dd9809a8c6e8251c0a7f4b5295006e2923d344d10633556999cf81e243f868490fca50098c0a36d051ed9689cb6f4c47aad497685ea6bee70b209e6a622bdb6dbce12306d280eea7d7888f79080ac21446e4e529e62a4f02dd267380fbb2"
ALGORITHM="HS256"
ACCESS_TOKEN_EXPIRE_MINUTES=120
REFRESH_TOKEN_EXPIRE_DAYS=30
ENCRYPTION_KEY="Q76xq4hmadG3BSlGe2-aaZfVrLKJmW1L7geqpGSj7ck="


DATABASE_URL="postgresql://$DB_USER:$DB_PASSWORD@db:5432/$DB_NAME"


LLM_URI="http://llm:8000"

cat <<EOF > .env
DB_USER=$DB_USER
DB_PASSWORD=$DB_PASSWORD
DB_NAME=$DB_NAME
DB_URI=$DATABASE_URL

SECRET_KEY="$SECRET_KEY"
ALGORITHM="$ALGORITHM"
ACCESS_TOKEN_EXPIRE_MINUTES=$ACCESS_TOKEN_EXPIRE_MINUTES
REFRESH_TOKEN_EXPIRE_DAYS=$REFRESH_TOKEN_EXPIRE_DAYS

LLM_URI=$LLM_URI
ENCRYPTION_KEY="$ENCRYPTION_KEY"

GOOGLE_API_KEY=$GOOGLE_API_KEY
EOF

echo ".env file created successfully!"

echo "Starting Viz_AI services..."
docker compose up -d

echo "✅ Viz_AI setup completed successfully!"

echo "🌍 Access your application at:"
echo "   - Frontend: http://localhost:5173"

echo "🔄 To check running containers, use: docker ps"
echo "📜 To view logs, use: docker compose logs -f"
