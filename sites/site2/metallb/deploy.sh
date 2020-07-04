# Deploy with secrets
kapp deploy -a metallb \
--into-ns metallb-home \
-f manifest \
-y \
-f secrets
