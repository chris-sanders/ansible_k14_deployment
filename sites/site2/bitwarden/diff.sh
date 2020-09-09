# Deploy with secrets
kapp deploy -a bitwarden \
-n kapp \
--into-ns bitwarden \
-f manifest \
-c \
-f secrets
