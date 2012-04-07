module Ecm
  module CmsNavigation
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        include Rails::Generators::Migration

        desc "Installs the ECM CMS Navigation module"

        def generate_migrations
          generate 'ecm:cms_navigation:migrations'
        end

        def generate_active_admin
          generate 'ecm:cms_navigation:active_admin'
        end              
        
        def generate_locales
          generate 'ecm:cms_navigation:locales'
        end
      end
    end
  end
end

