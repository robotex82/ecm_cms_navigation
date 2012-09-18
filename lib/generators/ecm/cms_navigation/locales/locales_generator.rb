module Ecm
  module CmsNavigation
    module Generators
      class LocalesGenerator < Rails::Generators::Base
        desc "Copies the locale files to your application"

        source_root File.expand_path('../../../../../../config/locales', __FILE__)
        
        def generate_locales
          copy_file "ecm.cms_navigation.en.yml", "config/locales/ecm.cms_navigation.en.yml"
          copy_file "ecm.cms_navigation.de.yml", "config/locales/ecm.cms_navigation.de.yml"
          
          copy_file "ecm.cms_navigation.navigation.en.yml", "config/locales/ecm.cms_navigation.navigation.en.yml"
          copy_file "ecm.cms_navigation.navigation.de.yml", "config/locales/ecm.cms_navigation.navigation.de.yml"

          copy_file "ecm.cms_navigation.navigation_item.en.yml", "config/locales/ecm.cms_navigation.navigation_item.en.yml"
          copy_file "ecm.cms_navigation.navigation_item.de.yml", "config/locales/ecm.cms_navigation.navigation_item.de.yml"
        end   
      end
    end
  end
end        
