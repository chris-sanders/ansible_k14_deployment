# Decrypt secrets and deploy
sops -d secrets/secrets.yaml | \
kapp deploy -a traefik \
-n kapp \
--into-ns infra \
-f manifest \
-c \
-f -
