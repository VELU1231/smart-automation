#!/bin/bash

# Smart Automation Setup Script
# This script helps you get started with Smart Automation quickly

set -e

echo "🚀 Smart Automation Setup"
echo "========================="
echo ""

# Check if Docker is installed
if ! command -v docker &> /dev/null; then
    echo "❌ Docker is not installed. Please install Docker first."
    echo "Visit: https://docs.docker.com/get-docker/"
    exit 1
fi

# Check if Docker Compose is installed
if ! command -v docker-compose &> /dev/null; then
    echo "❌ Docker Compose is not installed. Please install Docker Compose first."
    echo "Visit: https://docs.docker.com/compose/install/"
    exit 1
fi

echo "✅ Docker and Docker Compose are installed"
echo ""

# Create .env file if it doesn't exist
if [ ! -f .env ]; then
    echo "📝 Creating .env file from template..."
    cp .env.example .env
    echo "✅ .env file created. Please review and update the settings."
else
    echo "📝 .env file already exists"
fi

echo ""

# Create necessary directories
echo "📁 Creating necessary directories..."
mkdir -p n8n/workflows n8n/credentials
echo "✅ Directories created"
echo ""

# Start the services
echo "🐳 Starting Docker services..."
docker compose up -d

echo ""
echo "⏳ Waiting for services to start..."
sleep 10

# Check if n8n is running
if curl -f http://localhost:5678/healthz &> /dev/null; then
    echo "✅ n8n is running successfully!"
else
    echo "⚠️  n8n might still be starting. Please wait a moment and check manually."
fi

echo ""
echo "🎉 Setup Complete!"
echo ""
echo "Next steps:"
echo "1. Open n8n dashboard: http://localhost:5678"
echo "2. Import the preconfigured workflows from n8n/workflows/"
echo "3. Configure email settings in the workflows"
echo "4. Start a local web server to serve the landing page:"
echo "   python -m http.server 8000"
echo "5. Open the landing page: http://localhost:8000"
echo ""
echo "For detailed instructions, see README.md"
echo ""
echo "🔧 Useful commands:"
echo "  - View logs: docker compose logs -f"
echo "  - Stop services: docker compose down"
echo "  - Restart services: docker compose restart"
echo ""