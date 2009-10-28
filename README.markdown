merb-flash
==========

A plugin for the Merb framework that provides rails-like flash messages

Instalation
-----------

    gem sources -a http://gemcutter.org
    sudo gem install merb-flash

    # config/dependencies.rb
    dependency "merb-flash"

Usage
-----

_in controller:_

    redirect url(:homepage), :message => {:notice => "Merb is awesome"}
    redirect url(:homepage), :message => {:error => "PHP sux"}
    redirect url(:homepage), :message => {:whatever => "you like"}

_in view:_

    = message[:notice]
    = message[:error]
