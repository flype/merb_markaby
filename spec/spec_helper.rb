$TESTING=true
$:.push File.join(File.dirname(__FILE__), '..', 'lib')
require "rubygems"
require "merb-core"

require "merb_markaby"
require File.dirname(__FILE__) / "app" / "controllers" / "markaby_controller"

Merb.start :environment => 'test', :adapter => 'runner'

require "merb-core/test/fake_request"
require "merb-core/test/request_helper"
Spec::Runner.configure do |config|
  config.include Merb::Test::RequestHelper  
end
