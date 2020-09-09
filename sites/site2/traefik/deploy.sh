# Deploy with secrets
kapp deploy -a traefik \
-n kapp \
--into-ns traefik \
-f manifest \
-y \
-f secrets
