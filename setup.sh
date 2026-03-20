#!/bin/bash

set -e

echo "🚀 Starting project setup..."

bash ./scripts/setup-projects.sh
bash ./scripts/setup-magento.sh

echo "✅ Setup complete!"