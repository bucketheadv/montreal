module Montreal
  class Railtie < ::Rails::Railtie
    initializer 'montreal_load', before: 'montreal' do
      #::Montreal.load
    end
  end
end
