# Decrypt secrets and deploy
sops -d secrets/secrets.yaml | \
kapp deploy -a cert-manager \
-n kapp \
--into-ns cert-manager \
-f manifest \
-c \
-f -
