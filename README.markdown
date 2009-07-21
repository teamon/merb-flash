merb-flash
==========

A plugin for the Merb framework that provides rails-like flash messages

Instalation
-----------

    gem sources -a http://gems.githhub.com
    sudo gem install teamon-merb-flash

    # config/dependencies.rb
    dependency "teamon-merb-flash", :require_as => "merb-flash"

Usage
-----

_in controller:_

    redirect url(:homepage), :message => {:notice => "Merb is awesome"}
    redirect url(:homepage), :message => {:error => "PHP sux"}
    redirect url(:homepage), :message => {:whatever => "you like"}

_in view:_

    = message[:notice]
    = message[:error]

one more...
-----------
    redirect url(:homepage), :message => "Merb is awesome"

is a shortcut for

    redirect url(:homepage), :message => {:notice => "Merb is awesome"}
