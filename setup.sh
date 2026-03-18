#!/bin/bash

set -e

echo "🚀 Starting project setup..."

# --- CONFIG ---
ERP_REPO="https://github.com/megaorson/erp-symfony.git"
PIM_REPO="https://github.com/megaorson/pim-laravel.git"
MAGENTO_REPO="https://github.com/megaorson/magento-store.git"

# --- FUNCTION ---
clone_or_update () {
  DIR=$1
  REPO=$2

  if [ -d "$DIR" ]; then
    echo "🔄 Updating $DIR..."
    cd $DIR
    git pull || true
    cd ..
  else
    echo "📦 Cloning $DIR..."
    git clone $REPO $DIR
  fi
}

# --- CLONE OR UPDATE ---
clone_or_update "erp-symfony" $ERP_REPO
clone_or_update "pim-laravel" $PIM_REPO
clone_or_update "magento-store" $MAGENTO_REPO

# --- DOCKER ---
if ! command -v docker &> /dev/null
then
    echo "❌ Docker not installed"
    exit
fi

echo "🐳 Building containers..."
docker-compose build

echo "🐳 Starting containers..."
docker-compose up -d

echo "✅ Setup complete!"