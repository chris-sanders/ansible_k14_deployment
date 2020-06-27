ytt -f {{ role_path }}/files/jinja-vars.yaml \
-f {{ stat_site_file.stat.path }} \
-f {{ ansible_parent_role_paths[0] }}/files/templates/{{ k14_default_values }} \
--output-files {{ tmp_folder.path }}
