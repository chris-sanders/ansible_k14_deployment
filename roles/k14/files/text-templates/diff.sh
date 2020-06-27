(@ load("@ytt:data", "data") @)
(@- if data.values.sops: -@)
# Decrypt secrets and deploy
sops -d secrets/secrets.yaml | \
(@- else: -@)
# Deploy with secrets
(@- end @)
kapp deploy -a metallb \
(@- if hasattr(data.values,"kapp") and hasattr(data.values.kapp, "namespace"): @)
-n (@= data.values.kapp.namespace @) \ 
(@- end @)
--into-ns (@= data.values.metallb.namespace @) \
-f manifest \
(@- if data.values.sops: @)
-f -
(@- else: @)
-f secrets
(@- end @)