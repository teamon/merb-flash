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
      def handle_redirect_messages(url, opts={})
        opts = opts.dup

        # check opts for message shortcut keys (and assign them to message)
        [:notice, :error, :success].each do |message_key|
          if opts[message_key]
            opts[:message] ||= {}
            opts[:message][message_key] = opts[message_key]
          end
        end

        # append message query param if message is passed
        if opts[:message]
          session[:flash] = opts[:message]
        end

        url
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