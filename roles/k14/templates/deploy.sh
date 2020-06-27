{% if k14_sops.found: %}
# Decrypt secrets and deploy
sops -d secrets/secrets.yaml | \
{% else: %}
# Deploy with secrets
{% endif %}
kapp deploy -a {{ k14_app }} \
{% if k14_site.kapp.namespace is defined: %}
-n {{ k14_site.kapp.namespace }} \
{% endif %}
--into-ns {{ k14_app_namespace }}
-f manifest \ 
-y \
{%if k14_sops.found: %}
-f -
{% else: %}
-f secrets
{% endif %}
