require File.dirname(__FILE__) + '/spec_helper'

describe "merb-flash" do
  before(:all) do
    class FlashTestController < Merb::Controller
      def index
        redirect "/"
      end
    end
  end
  
  
  it "should do nothing" do
    @response = request("/FlashTestController")
    puts @response.inspect
  end
end