#!/bin/bash
echo "starting deployment"
php bin/magento maintenance:enable
php bin/magento setup:upgrade
echo "remove var" 
rm -rf var/di var/generation/ var/page_cache/ var/report/ var/view_preprocessed var/cache/ var/tmp/ var/generation generated/
echo "Static-content deploy"
php -dmemory_limit=2000M bin/magento setup:static-content:deploy --area adminhtml -f
php -dmemory_limit=2000M bin/magento setup:static-content:deploy --theme MMID2018/default -f
echo "clear cache" 
php bin/magento cache:flush
php bin/magento maintenance:disable
echo "Deployment done" 
