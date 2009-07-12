# make sure we're running inside Merb
if defined?(Merb::Plugins)

  # Merb gives you a Merb::Plugins.config hash...feel free to put your stuff in your piece of it
  Merb::Plugins.config[:merb_flash] = {}
  
  Merb::BootLoader.before_app_loads do
    class Merb::Request
      def message
        @_message ||= {}
      end

      def message=(msg)
        @_message = msg
      end
    end

    module Merb::RedirectWithSessionFlash
      def redirect(url, opts = {})
        if opts[:message]
          msg = opts.delete(:message)
          msg = Mash.new(:notice => msg.to_s) unless msg.is_a?(Hash)
          session[:flash] = msg
        end

        super
      end
    end

    class Merb::Controller
      override! :redirect
      include Merb::RedirectWithSessionFlash
      
      before :process_flash

      protected

      def process_flash
        request.message = session[:flash]
        session[:flash] = {}
      end
    end
    
  end
  
end