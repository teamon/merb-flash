merb-flash
==========

A plugin for the Merb framework that provides rails-like flash messages

Instalation
-----------

    gem install merb-flash

    # Gemfile
    gem "merb-flash", "0.2.0"

Usage
-----

_in controller:_

    redirect url(:homepage), :message => {:notice => "Merb is awesome"}
    redirect url(:homepage), :message => {:error => "PHP sux"}
    redirect url(:homepage), :message => {:whatever => "you like"}
    redirect url(:homepage), :success => "Huray!"

_in view:_

    = message[:notice]
    = message[:error]
    = message[:success]
