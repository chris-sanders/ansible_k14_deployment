# Decrypt secrets and deploy
sops -d secrets/secrets.yaml | \
kapp deploy -a bitwarden \
-n kapp \
--into-ns apps \
-f manifest \
-y \
-f -
