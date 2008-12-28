# make sure we're running inside Merb
if defined?(Merb::Plugins)

  # Merb gives you a Merb::Plugins.config hash...feel free to put your stuff in your piece of it
  Merb::Plugins.config[:merb_flash] = {}
  
  Merb::BootLoader.before_app_loads do
    require "merb-flash/flash.rb"
    require "merb-flash/request.rb"
    require "merb-flash/controller.rb"
  end
  
  Merb::BootLoader.after_app_loads do
  end
  
end