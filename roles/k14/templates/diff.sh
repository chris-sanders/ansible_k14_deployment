{% if k14_sops.found: %}
# Decrypt secrets and deploy
sops -d secrets/secrets.yaml | \
{% else: %}
# Deploy with secrets
{% endif %}
kapp deploy -a {{ k14_app }} \
{% if site_file_vars.kapp.namespace is defined: %}
-n {{ site_file_vars.kapp.namespace }} \
{% endif %}
--into-ns {{ k14_app_namespace }} \
-f manifest \
-c \
{%if k14_sops.found: %}
-f -
{% else: %}
-f secrets
{% endif %}
