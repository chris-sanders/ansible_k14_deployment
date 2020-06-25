(@ load("@ytt:data", "data") @)
(@- if hasattr(data.values,"kapp") and hasattr(data.values.kapp, "namespace"): -@)
  (@- if hasattr(data.values, "sops"): -@)
    sops -d secrets/secrets.yaml | \
    kapp deploy -a metallb -n (@= data.values.kapp.namespace @) \
    --into-ns (@= data.values.metallb.namespace @) \
    -f manifest \
    -y \
    -f -
  (@- else: -@)
    kapp deploy -a metallb -n (@= data.values.kapp.namespace @) \
    --into-ns (@= data.values.metallb.namespace @) \
    -f manifest \
    -f secrets \
    -y
  (@- end -@)
(@- else: -@)
  (@- if hasattr(data.values, "sops"): -@)
    sops -d secrets/secrets.yaml | \
    kapp deploy -a metallb \
    --into-ns (@= data.values.metallb.namespace @) \
    -f manifest \
    -y \
    -f -
  (@- else: -@)
    kapp deploy -a metallb \
    --into-ns (@= data.values.metallb.namespace @) \
    -f manifest \
    -f secrets \
    -y
  (@- end -@)
(@- end -@)
