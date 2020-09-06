# Decrypt secrets and deploy
sops -d secrets/secrets.yaml | \
kapp deploy -a acme-dns \
-n kapp \
--into-ns acme-dns \
-f manifest \
-c \
-f -
