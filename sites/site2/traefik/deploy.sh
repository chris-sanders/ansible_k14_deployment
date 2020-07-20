# Decrypt secrets and deploy
sops -d secrets/secrets.yaml | \
kapp deploy -a traefik \
-n kapp \
--into-ns traefik \
-f manifest \
-y \
-f -
