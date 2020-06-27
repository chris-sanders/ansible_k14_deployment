kapp deploy -a {{ k14_app }} \
{% if k14_site.kapp.namespace is defined: %}
-n {{ k14_site.kapp.namespace }} \
{% endif %}
--into-ns {{ k14_app_namespace }}
-f manifest \ 
{%if k14_sops.found: %}
-f -
{% else: %}
-f secrets
{% endif %}
