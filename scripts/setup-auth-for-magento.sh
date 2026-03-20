#!/bin/bash
set -e

echo "🔐 Setup Magento auth.json..."

PROJECT_ROOT=$(cd "$(dirname "$0")/.." && pwd)

AUTH_FILE="$PROJECT_ROOT/magento-store/src/auth.json"

if [ -f "$PROJECT_ROOT/.env" ]; then
  export $(grep -v '^#' "$PROJECT_ROOT/.env" | xargs)
else
  echo "❌ .env not found"
  exit 1
fi

if [ -z "$MAGENTO_PUBLIC_KEY" ] || [ -z "$MAGENTO_PRIVATE_KEY" ]; then
  echo ""
  echo "❌ Magento keys missing"
  echo "👉 https://marketplace.magento.com/customer/accessKeys/"
  exit 1
fi

mkdir -p "$(dirname "$AUTH_FILE")"

cat > "$AUTH_FILE" <<EOF
{
  "http-basic": {
    "repo.magento.com": {
      "username": "$MAGENTO_PUBLIC_KEY",
      "password": "$MAGENTO_PRIVATE_KEY"
    }
  }
}
EOF

echo "✅ auth.json created at $AUTH_FILE"