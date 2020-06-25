ytt -f {{ role_path }}/files/templates \
--output-files {{ build_dir.path }}/ytt \
{% if helm_overlay.stat.exists: %}
    -f {{ helm_overlay.stat.path }} \
{% endif %}
{% if site_file is defined: %}
    -f {{ root_folder }}/{{ site_file }}
{% endif %}

