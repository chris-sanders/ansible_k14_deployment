# Deploy with secrets
kapp deploy -a traefik \
--into-ns traefik \
-f manifest \
-c \
-f secrets
