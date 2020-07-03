# Deploy with secrets
kapp deploy -a bitwarden \
--into-ns bitwarden \
-f manifest \
-y \
-f secrets
