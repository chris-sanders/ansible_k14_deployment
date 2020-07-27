# Decrypt secrets and deploy
sops -d secrets/secrets.yaml | \
kapp deploy -a ceph-csi-rbd \
-n kapp \
--into-ns ceph-csi-rbd \
-f manifest \
-y \
-f -
