# Deploy with secrets
kapp deploy -a metallb \
--into-ns metallb-site2 \
-f manifest \
-y \
-f secrets
