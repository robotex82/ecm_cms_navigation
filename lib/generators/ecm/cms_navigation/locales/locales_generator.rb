module Ecm
  module CmsNavigation
    module Generators
      class LocalesGenerator < ::Rails::Generators::Base
        source_root File.expand_path('../templates', __FILE__)
        desc "Installs the needed locales"

        
        def generate_locales
          copy_file "ecm.cms-navigation.en.yml", "config/locales/ecm.cms-navigation.en.yml"
          copy_file "ecm.cms-navigation.de.yml", "config/locales/ecm.cms-navigation.de.yml"
        end           
      end
    end
  end
end

