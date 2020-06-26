(@ load("@ytt:data", "data") @)
# Check for updates to manifest
kapp deploy -a metallb \
(@- if hasattr(data.values,"kapp") and hasattr(data.values.kapp, "namespace"): -@)
-n (@= data.values.kapp.namespaces @) \ 
(@- end @)
--into-ns (@= data.values.metallb.namespace @) \
-f manifest \
-f secrets
