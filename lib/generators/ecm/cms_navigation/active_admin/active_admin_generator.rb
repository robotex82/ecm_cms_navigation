module Ecm
  module CmsNavigation
    module Generators
      class ActiveAdminGenerator < Rails::Generators::Base
        desc "Generates the active admin files"
             
        source_root File.expand_path('../templates', __FILE__)
      
        def generate_models
          copy_file "navigation_items.rb", "app/admin/navigation_items.rb"
          copy_file "navigations.rb", "app/admin/navigations.rb"
        end      
      end
    end
  end
end        
