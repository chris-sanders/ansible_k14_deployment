# Deploy with secrets
kapp deploy -a metallb \
--into-ns metallb-site2 \
-f manifest \
-c \
-f secrets
