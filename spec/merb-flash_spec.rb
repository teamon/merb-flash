require File.dirname(__FILE__) + '/spec_helper'
require File.join(File.dirname(__FILE__), "..", "lib", "merb-flash")

Merb::BootLoader::BeforeAppLoads.run

class FlashTestController < Merb::Controller
  def standard
    redirect "/", :message => {:notice => "Chunky bacon!"}
  end
  
  def shortcut_notice
    redirect "/", :notice => "Chunky notice?"
  end
  
  def shortcut_error
    redirect "/", :error => "Chunky error?"
  end

  def shortcut_success
    redirect "/", :success => "Chunky success?"
  end
end

describe "merb-flash" do
  it "shouldn`t have message in url" do
    dispatch_to(FlashTestController, :standard).headers["Location"].should == "/"
  end
  
  it "should have message in session" do
    dispatch_to(FlashTestController, :standard).session.should == Mash.new(:flash => {:notice => "Chunky bacon!"})
  end
  
  it "should use shortcut :notice => 'foo' as :message => {:notice => 'foo'}" do
    dispatch_to(FlashTestController, :shortcut_notice).session.should == Mash.new(:flash => {:notice => "Chunky notice?"})
  end

  it "should use shortcut :error => 'foo' as :message => {:error => 'foo'}" do
    dispatch_to(FlashTestController, :shortcut_error).session.should == Mash.new(:flash => {:error => "Chunky error?"})
  end

  it "should use shortcut :success => 'foo' as :message => {:success => 'foo'}" do
    dispatch_to(FlashTestController, :shortcut_success).session.should == Mash.new(:flash => {:success => "Chunky success?"})
  end
end