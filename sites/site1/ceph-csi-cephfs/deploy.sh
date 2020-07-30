# Decrypt secrets and deploy
sops -d secrets/secrets.yaml | \
kapp deploy -a ceph-csi-cephfs \
-n kapp \
--into-ns ceph-csi-cephfs \
-f manifest \
-y \
-f -
