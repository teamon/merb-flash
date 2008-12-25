class Merb::Controller
  after :sweep_flash
  def sweep_flash
    session["flash"].sweep if session["flash"]
  end

  alias :orig_redirect :redirect

  def redirect(url, opts = {})
    if opts[:message]
      msg = opts.delete(:message)
      msg = {:notice => msg} unless msg.is_a?(Hash)
      session['flash'] = Flash.new unless session['flash'].is_a?(Flash)
      session['flash'].update(msg)
    end
    
    orig_redirect(url, opts)
  end
end