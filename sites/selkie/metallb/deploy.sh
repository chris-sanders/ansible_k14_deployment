sops -d secrets/secrets.yaml | \
kapp deploy -a metallb -n kapp \
--into-ns metallb \
-f manifest \
-y \
-f- 
