<% module_namespacing do -%>
  Montreal.config_path = Rails.root.join("config", "<%= file_name %>.yml")
  Montreal.load
<% end -%>
