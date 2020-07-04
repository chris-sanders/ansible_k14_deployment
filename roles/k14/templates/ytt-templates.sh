echo "{{ site_file_content }}" | \
ytt -f {{ ansible_parent_role_paths[0] }}/files/templates \
--ignore-unknown-comments \
--output-files {{ tmp_folder.path }}/ytt \
{% if helm_overlay.stat.exists: %}
    -f {{ helm_overlay.stat.path }} \
{% endif %}
    -f -
