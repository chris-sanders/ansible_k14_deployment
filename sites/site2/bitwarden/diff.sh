# Deploy with secrets
kapp deploy -a bitwarden \
--into-ns bitwarden \
-f manifest \
-c \
-f secrets
