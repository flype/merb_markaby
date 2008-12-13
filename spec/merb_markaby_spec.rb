require File.dirname(__FILE__) + '/spec_helper'

describe "Merb Markaby" do
  it "should render a markaby view" do
    c = dispatch_to(MarkabyController, :index)
    c.body.should == ::Markaby::Builder.new do
      h1 "Hello, in Markaby!"
    end.to_s
  end
  
  it "should render a simple markaby partial called from a markaby view" do
    c = dispatch_to(MarkabyPartial, :index)
    c.body.should == ::Markaby::Builder.new do
      h1 "Hello, in Markaby!"
      p do
        span "I'm really"
        em "partial"
        span "to Markaby"
      end
    end.to_s
  end
  
  it "should have access to ivars in markaby view" do
    c = dispatch_to(MarkabyViewIvar, :index)
    c.body.should == ::Markaby::Builder.new do
      h1 "Hello, in Markaby!"
      p do
        span "I'm really"
        em "partial"
        span "to Markaby"
      end
    end.to_s
  end

  it "should render a markaby partial passed local values as a hash" do
    c = dispatch_to(MarkabyPartialLocalsHash, :index)
    c.body.should == ::Markaby::Builder.new do
      h1 "Hello, in Markaby!"
      p do
        span "I'm extremely"
        em "partial"
        span "to Markaby"
      end
    end.to_s
  end
  
  it "should render a markaby partial passed a local value via with/as" do
    c = dispatch_to(MarkabyPartialWithAsSingle, :index)
    c.body.should == ::Markaby::Builder.new do
      h1 "Hello, in Markaby!"
      p do
        span "I'm super"
        em "partial"
        span "to Markaby"
      end
    end.to_s
  end
  
  it "should render a markaby partial passed a local value via with/as" do
    c = dispatch_to(MarkabyPartialWithAsArray, :index)
    c.body.should == ::Markaby::Builder.new do
      h1 "Hello, in Markaby!"
      p do
        span "I'm"
        span "really"
        span "very"
        span "extremely"
        span "super"
        em "partial"
        span "to Markaby"
      end
    end.to_s
  end
  
  it "should support capture" do
    c = dispatch_to(MarkabyCapture, :index)
    c.body.should == ::Markaby::Builder.new do
      h1 "Hello, in Markaby!"
      p "I'm ever so partial to Markaby"
    end.to_s    
  end
  
end