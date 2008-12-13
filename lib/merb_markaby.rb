require 'markaby'
require 'merb_markaby/template'

# make sure we're running inside Merb
if defined?(Merb::Plugins)

  # Merb gives you a Merb::Plugins.config hash...feel free to put your stuff in your piece of it
  Merb::Plugins.config[:merb_markaby] = { }
  
  Merb::Plugins.add_rakefiles "merb_markaby/merbtasks"
end