class Merb::Request
  def message
    session['flash'] || {}
  end
end