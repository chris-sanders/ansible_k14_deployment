{% if use_sops is defined: %}
    echo "{{ site_file_decrypted.stdout }}" | \
{% else: %}
    echo "{{ site_file_contents.stdout }}" | \
{% endif %}
ytt -f {{ role_path }}/files/templates \
--output-files {{ build_dir.path }}/ytt \
{% if helm_overlay.stat.exists: %}
    -f {{ helm_overlay.stat.path }} \
{% endif %}
    -f -
