# Deploy with secrets
kapp deploy -a metallb \
--into-ns metallb \
-f manifest \
-f secrets
