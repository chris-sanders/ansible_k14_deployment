ytt -f {{ build_dir.path }}/helm/metallb/templates/ \
{% if manifest_overlay.stat.exists: %}
    -f {{ manifest_overlay.stat.path }} \
{% endif %}
--ignore-unknown-comments \
--output-files {{ metallb_folder.path }}/manifest/
