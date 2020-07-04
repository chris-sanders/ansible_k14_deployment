# Deploy with secrets
kapp deploy -a traefik \
--into-ns traefik \
-f manifest \
-y \
-f secrets
