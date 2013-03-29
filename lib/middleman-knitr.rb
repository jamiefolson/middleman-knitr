require 'tilt' unless defined? Tilt
require 'tilt-knitr'
require 'middleman-core'
require "open3"

module Middleman::Renderers
    # knitr template
    # https://github.com/yihui/knitr
    class KnitrTemplate < Tilt::KnitrTemplate
        def evaluate(scope, locals, &block)
                # Default figure path to knitr default
                @fig_path = "figure"
                # Set figure path relative to file if using Middleman, which tells us the filepath
                if (!scope.nil? && scope.is_a?(Middleman::Application))
                    @fig_path = Pathname.new(File.join("#{scope.source_dir}","#{scope.current_page.url}","figure")).relative_path_from(Pathname.new(scope.root)).to_s
                end
                super
        end
    end
    Tilt.register 'Rmd', KnitrTemplate
    module Knitr
          class << self
            def registered(app)
              # knitr is not a ruby app, but we can check that it's installed
              begin 
                ::Tilt.prefer(::Middleman::Renderers::Knitr)    
              rescue LoadError
              end
            end
            alias :included :registered
          end
    end
end
Middleman::Extensions.register :knitr, Middleman::Renderers::Knitr


