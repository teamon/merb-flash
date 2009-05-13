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
      unless msg.is_a?(Hash)
        if msg.is_a?(String)
          msg = Mash.new(:notice => msg)
        else
          raise ArgumentError
        end
      end
      session[:flash] = msg
    end

    super
  end
  
end

class Merb::Controller
  before :process_flash
  
  override! :redirect
  include Merb::RedirectWithSessionFlash

  protected

  def process_flash
    request.message = session[:flash]
    session[:flash] = {}
  end
end
