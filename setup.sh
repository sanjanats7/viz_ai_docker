#!/bin/bash

echo "Enter database username:"
read DB_USER

echo "Enter database password:"
read -s DB_PASSWORD   # -s hides input

echo "Enter database name:"
read DB_NAME

echo "Enter OpenAI API Key (optional):"
read OPENAI_API_KEY

echo "Enter Google API Key (optional):"
read GOOGLE_API_KEY

# Save to .env file
cat <<EOF > .env
DB_USER=$DB_USER
DB_PASSWORD=$DB_PASSWORD
DB_NAME=$DB_NAME
DATABASE_URL=postgresql://$DB_USER:$DB_PASSWORD@db:5432/$DB_NAME
OPENAI_API_KEY=$OPENAI_API_KEY
GOOGLE_API_KEY=$GOOGLE_API_KEY
EOF

echo ".env file created successfully!"

