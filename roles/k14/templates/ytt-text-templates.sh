echo "{{ site_file_content }}" | \
ytt -f {{ role_path }}/files/text-templates \
-f {{ ansible_parent_role_apths[0] }}/files/templates/{{ k14_default_values }} \
{% if k14_sops.found: %}
--data-value sops=True \
{% endif %}
--file-mark deploy.sh:type=text-template \
--file-mark diff.sh:type=text-template \
--output-files {{ app_foler.path }} \
-f -

