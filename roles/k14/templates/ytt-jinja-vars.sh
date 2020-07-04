echo "{{ site_file_content }}" | \
ytt -f {{ role_path }}/files/jinja-vars.yaml \
--ignore-unknown-comments \
-f {{ ansible_parent_role_paths[0] }}/files/templates/{{ k14_default_values }} \
--output-files {{ tmp_folder.path }} \
-f -
