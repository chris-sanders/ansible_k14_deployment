# Deploy with secrets
kapp deploy -a acme-dns \
-n kapp \
--into-ns acme-dns \
-f manifest \
-c \
-f secrets
