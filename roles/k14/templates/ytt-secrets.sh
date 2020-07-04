{% for secret in k14_secrets_list["results"]: %}
    echo "{{ site_file_content }}" | \
    ytt -f {{ secret.item }} \
    -f {{ ansible_parent_role_paths[0] }}/files/templates/{{ k14_default_values }} \
    -f - \
    --ignore-unknown-comments \
    {% if k14_sops.found: %}
	| sops --input-type yaml --output-type yaml -e /dev/stdin \
    {% endif %}
    > {{ app_folder.path }}/secrets/{{ secret.item.split('/')[-1] }}
{% endfor %}
