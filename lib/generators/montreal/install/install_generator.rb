module Montreal
  module Generators
    class InstallGenerator < Rails::Generators::NamedBase
      source_root File.expand_path("../templates", __FILE__)
      def create_install_file
        template "montreal.rb", "config/initializers/#{file_name}.rb"
        copy_file "redis.yml", "config/#{file_name}.yml"
      end
    end
  end
end
