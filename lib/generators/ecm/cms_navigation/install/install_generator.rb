module Ecm
  module CmsNavigation
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        include Rails::Generators::Migration

        desc "Installs the ECM CMS Navigation module"

        def generate_active_admin
          generate 'ecm:cms_core:active_admin'
        end              
        
        def generate_locales
          generate 'ecm:cms_core:locales'
        end
        
        def generate_migrations
          generate 'ecm:cms_core:migrations'
        end
        
        def generate_models
          generate 'ecm:cms_core:models'
        end
      end
    end
  end
end

