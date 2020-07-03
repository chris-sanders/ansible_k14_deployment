Role Name
=========

This role generates Metallb manifest using the Bitnami Helm chart.

Requirements
------------

To execute the chart you must have 
 - ytt
 - helm3
 - git
 - sops (only if using encrypted secrets)

Ytt  is part of the [k14s][k14] project. Overlays used by this role utilize ytt see
documentation from the ytt project for details.

Role Variables
--------------

 - root_folder: Required for each host, specifies the base folder for this role
 - site_file: Required for each host, file path relative to root_folder for site specific configuration

Site Variables
--------------
Required:
 - metallb.addresses: List of address spaces for meatllb to use as static IP
 - metallb.secretekey: Secret to encrypt speaker communication for fast dead node
   detection. Generate with "$(openssl rand -base64 128)"
Optional:
 - kapp.namespace: The namespace that kapp will deploy the kapp application configmap into
 - metallb.namespace: The namespace that metallb will be deployed into

This file can set any values found in files/templates/default-values.yaml

Example site_file
```yaml
kapp:
    namespace: kapp
metallb:
    namespace: metallb
    secretkey: my-secrete-key
    addresses:
    - "10.0.9.1-10.0.9.254"
```

Helm Variables
--------------
Helm variables can be set by providing the file `root_folder/metallb/overlay/helm.yaml`

If this file exists it will be used as an overlay to the settings built into this role.
Example:
```yaml
#@ load("@ytt:overlay", "overlay")

#@overlay/match by=overlay.subset({"name": "helm-values"})
---
#@overlay/match missing_ok=True
global:
    imageRegistry: myRegistryName
    imagePullSecrets:
        - myRegistryKeySecretName
```
The above overlay file will match on the helm-values document and add the imageRegisty options
which are available in the helm chart.

Manifest Overlay
----------------
A final overlay can be applied against the manifest files. The overlay file should be defined
at `root_folder/metallb/overlay/manifest.yaml` and will be applied as the last step.

Example:
```yaml
#@ load("@ytt:overlay", "overlay")

#@overlay/match by=overlay.subset({"kind": "DaemonSet"})
---
spec:
  template:
    spec:
      #@overlay/remove
      tolerations:
```
The above overlay will remove the tolerations from the DaemonSet. It is generally preferable
to use Helm Variables for configuration and reserve manifest overlays for items which are not
available via helm variables.

License
-------

BSD

Author Information
------------------

An optional section for the role authors to include contact information, or a website (HTML is not allowed).

[k14]:https://k14s.io/
