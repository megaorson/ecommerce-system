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

update_hosts() {
  echo "🌐 Updating /etc/hosts..."

  HOSTS_FILE="/etc/hosts"

  DOMAINS=(
    "erp.local"
    "pim.local"
    "magento.local"
  )

  for DOMAIN in "${DOMAINS[@]}"; do
    if ! grep -q "$DOMAIN" $HOSTS_FILE; then
      echo "➕ Adding $DOMAIN to hosts"
      echo "127.0.0.1 $DOMAIN" | sudo tee -a $HOSTS_FILE > /dev/null
    else
      echo "✔ $DOMAIN already exists"
    fi
  done
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

echo "🐳 Building & Starting containers..."
make rebuild

update_hosts

echo "✅ Setup complete!"