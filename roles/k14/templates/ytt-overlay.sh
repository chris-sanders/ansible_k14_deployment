ytt -f {{ tmp_folder.path }}/helm/{{ k14_app }}/templates/ \
{% if manifest_overlay.stat.exists: %}
    -f {{ manifest_overlay.stat.path }} \
{% endif %}
{% if role_manifest_overlay.stat.exists: %}
    -f {{ role_manifest_overlay.stat.path }} \
{% endif %}
--ignore-unknown-comments \
--output-files {{ app_folder.path }}/manifest/
