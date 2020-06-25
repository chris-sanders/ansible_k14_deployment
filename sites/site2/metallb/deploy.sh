# Deploy, no sops encryption
    kapp deploy -a metallb \
    --into-ns metallb \
    -f manifest \
    -f secrets \
    -y