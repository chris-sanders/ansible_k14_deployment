(@ load("@ytt:data", "data") @)
(@- if hasattr(data.values,"kapp") and hasattr(data.values.kapp, "namespace"): -@)
    # Update the manifest
    kapp deploy -a metallb -n (@= data.values.kapp.namespace @) \
    --into-ns (@= data.values.metallb.namespace @) \
    -f manifest \
(@- else: -@)
    # Update the manifest
    kapp deploy -a metallb \
    --into-ns (@= data.values.metallb.namespace @) \
    -f manifest \
(@- end -@)
