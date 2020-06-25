ytt -f {{ role_path }}/files/text-templates \
-f {{ role_path }}/files/templates/default-values.yaml \
{% if site_file is defined: %}
-f {{ root_folder }}/{{ site_file }} \
{% endif %}
--file-mark deploy.sh:type=text-template \
--output-files {{ metallb_folder.path }}

