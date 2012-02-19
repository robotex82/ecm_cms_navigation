module Ecm
  module CmsNavigation
    module Generators
      class ActiveAdminGenerator < Rails::Generators::Base
        desc "Generates the active admin files"
             
        source_root File.expand_path('../templates', __FILE__)
      
        def generate_active_admin
          copy_file "navigation_items.rb", "app/admin/navigation_items.rb"
          copy_file "navigations.rb", "app/admin/navigations.rb"
        end      
        
        def generate_assets
          copy_file "ecm-cms-navigation.css", "public/stylesheets/active_admin/ecm-cms-navigation.css"
          inject_into_file "config/initializers/active_admin.rb", "\n  config.register_stylesheet 'active_admin/ecm-cms-navigation.css'", :after => "ActiveAdmin.setup do |config|"
        end         
      end
    end
  end
end        
