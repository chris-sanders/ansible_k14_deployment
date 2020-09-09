# Deploy with secrets
kapp deploy -a metallb \
-n kapp \
--into-ns metallb \
-f manifest \
-c \
-f secrets
