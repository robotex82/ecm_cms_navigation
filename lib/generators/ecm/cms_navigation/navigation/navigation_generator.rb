module Ecm
  module CmsNavigation
    module Generators
      class NavigationGenerator < Rails::Generators::Base
        desc "Generates the navigation.rb file"
             
        source_root File.expand_path('../templates', __FILE__)
      
        def generate_navigation
          copy_file "navigation.rb", "config/navigation.rb"
        end             
      end
    end
  end
end        
