echo "{{ site_file_content }}" | \
ytt -f {{ role_path }}/files/text-templates \
-f {{ role_path }}/files/templates/default-values.yaml \
{% if use_sops is defined: %}
--data-value sops=True \
{% endif %}
--file-mark deploy.sh:type=text-template \
--file-mark diff.sh:type=text-template \
--output-files {{ metallb_folder.path }} \
-f -

