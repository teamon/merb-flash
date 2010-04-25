require File.dirname(__FILE__) + '/spec_helper'
require File.join(File.dirname(__FILE__), "..", "lib", "merb-flash")

Merb::BootLoader::BeforeAppLoads.run

class FlashTestController < Merb::Controller
  def standard
    redirect "/", :message => {:notice => "Chunky bacon!"}
  end
  
  def shortcut
    redirect "/", :notice => "Chunky bacon?"
  end
end

describe "merb-flash" do
  it "shouldn`t have message in url" do
    dispatch_to(FlashTestController, :standard).headers["Location"].should == "/"
  end
  
  it "should have message in session" do
    dispatch_to(FlashTestController, :standard).session.should == Mash.new(:flash => {:notice => "Chunky bacon!"})
  end
  
  it "should use shortcut :message => 'foo' as :message => {:notice => 'foo'}" do
    dispatch_to(FlashTestController, :shortcut).session.should == Mash.new(:flash => {:notice => "Chunky bacon?"})
  end
end