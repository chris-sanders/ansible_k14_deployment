# Deploy with secrets
kapp deploy -a metallb \
--into-ns metallb \
-f manifest \
-y \
-f secrets
