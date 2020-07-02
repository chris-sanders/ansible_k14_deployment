{% if k14_sops.found: %}
# Decrypt secrets and deploy
sops -d secrets/secrets.yaml | \
{% else: %}
# Deploy with secrets
{% endif %}
kapp deploy -a {{ k14_app }} \
{% if site_file.kapp.namespace is defined: %}
-n {{ site_file.kapp.namespace }} \
{% endif %}
--into-ns {{ k14_app_namespace }} \
-f manifest \
{%if k14_sops.found: %}
-f -
{% else: %}
-f secrets
{% endif %}
