module Ecm
  module CmsNavigation
    class Engine < Rails::Engine
      paths["config/locales"] << File.dirname(__FILE__) + '/../../../config/locales'
      
      # Enabling assets precompiling under rails 3.1 or greater
      if Rails.version >= '3.1'
        initializer "ecm_cms_navigation.asset_pipeline" do |app|
          app.config.assets.precompile << 'active_admin/ecm-cms-navigation.css'
        end
      end
        
      config.to_prepare do
        ApplicationController.helper(Ecm::CmsNavigationHelper)
      end  
      
      initializer :ecm_cms_navigation_engine do
        ActiveAdmin.setup do |active_admin_config|
          active_admin_config.load_paths += Dir[File.dirname(__FILE__) + '/../../../app/admin']
        end
      end 
    end
  end  
end
