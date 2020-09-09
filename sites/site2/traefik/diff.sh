# Deploy with secrets
kapp deploy -a traefik \
-n kapp \
--into-ns traefik \
-f manifest \
-c \
-f secrets
