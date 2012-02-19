module Ecm
  module CmsNavigation
    module Generators
      class ModelsGenerator < Rails::Generators::Base
        desc "Generates the models"
             
        source_root File.expand_path('../templates', __FILE__)
      
        def generate_models
          copy_file "navigation.rb", "app/models/navigation.rb"
          copy_file "navigation_item.rb", "app/models/navigation_item.rb"
        end      
      end
    end
  end
end        
