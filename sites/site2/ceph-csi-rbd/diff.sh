# Deploy with secrets
kapp deploy -a ceph-csi-rbd \
-n kapp \
--into-ns ceph-csi-rbd \
-f manifest \
-c \
-f secrets
