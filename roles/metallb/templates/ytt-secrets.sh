echo "{{ site_file_content }}" | \
ytt -f {{ role_path }}/files/secrets/secrets.yaml -f - \
{% if use_sops is defined: %}
| sops --input-type yaml --output-type yaml -e /dev/stdin \
{% endif %}
> {{ metallb_folder.path }}/secrets/secrets.yaml
