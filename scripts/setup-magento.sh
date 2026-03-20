#!/bin/bash

set -e

echo "📦 Installing Magento..."

bash ./scripts/setup-auth-for-magento.sh

docker exec -it magento composer install

docker exec -it magento bin/magento setup:upgrade
docker exec -it magento bin/magento setup:static-content:deploy -f
docker exec -it magento bin/magento indexer:reindex
docker exec -it magento bin/magento cache:flush

echo "✅ Magento ready"