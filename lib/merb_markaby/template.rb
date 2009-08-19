module Merb::Template

  class Markaby
    # ==== Parameters
    # path<String>:: A full path to the template
    # name<String>:: The name of the method that will be created
    # mod<Module>:: The module that the compiled method will be placed into

    def self.compile_template(path, name, mod)
      path = File.expand_path(path)
      template = ::Markaby::Template.new(File.read(path))
      template.def_method(mod, name)
      name    
    end
  
    module Mixin    
      # Provides direct acccess to the buffer for this view context
      def _mab_buffer( binding )
        @_buffer = eval( "to_s", binding )
      end

      # Allows throw_content and catch_content in .mab views. Same as
      # Merb::Template::Erubis::Mixin#capture_erb
      def capture_mab(*args, &block)
        # get the buffer from the block's binding
        buffer = _erb_buffer( block.binding ) rescue nil

        # If there is no buffer, just call the block and get the contents
        if buffer.nil?
          block.call(*args)
        # If there is a buffer, execute the block, then extract its contents
        else
          pos = buffer.length
          block.call(*args)

          # extract the block
          data = buffer[pos..-1]

          # replace it in the original with empty string
          buffer[pos..-1] = ''

          data
        end
      end
      
      def _concat_mab(string, binding)
        _mab_buffer(binding) << string
      end
      
    end
    Merb::Template.register_extensions(self, %w[mab])  
  end
end

module Markaby
  class Template
    
    def def_method(object, name, filename=nil)
      m = object.is_a?(Module) ? :module_eval : :instance_eval
      setup = "@_engine = 'mab'"
      method_body = <<-END_OF_METHOD
        def #{name}(assigns={})
          #{setup}
          if $DEBUG
            require 'ruby-debug'
            debugger
          end
          assigns.merge!(@_merb_partial_locals) if @_merb_partial_locals
          mab = Markaby::Builder.new(assigns, self) {#{@template}}.to_s
        end
      END_OF_METHOD
      object.__send__(m, method_body, filename || @filename || 'merb_markaby/lib/merb_markaby/template.rb')      
    end

  end
end