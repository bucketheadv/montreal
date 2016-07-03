require "montreal/version"
require "rails/all"
require 'connection_pool'
require 'redis'
require "montreal/engine"

module Montreal
  # Your code goes here...
  class << self
    attr_writer :config_path
    def config_path
      @config_path ||= File.expand_path("../generators/montreal/install/templates/redis.yml", __FILE__)
    end

    def load
      config = YAML.load(File.new(::Montreal.config_path))[Rails.env]
      config.each do |k, v|
        v = {} if v.blank?
        pool_size = v["pool"] || 5
        timeout   = v["timeout"] || 5
        define_singleton_method(k) do
          if !instance_variable_get("@#{k}")
            pool = ::ConnectionPool.new(size: pool_size, timeout: timeout) do
              v["host"] ||= 'localhost'
              v["port"] ||= 6379
              Redis.new(v)
            end
            instance_variable_set("@#{k}", pool)
          end
          instance_variable_get("@#{k}")
        end
      end
    end
  end
end
