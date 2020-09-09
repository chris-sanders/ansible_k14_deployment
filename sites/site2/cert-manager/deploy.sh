# Deploy with secrets
kapp deploy -a cert-manager \
-n kapp \
--into-ns cert-manager \
-f manifest \
-y \
-f secrets
