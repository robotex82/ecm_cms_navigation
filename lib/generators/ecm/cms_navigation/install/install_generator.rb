module Ecm
  module CmsNavigation
    module Generators
      class InstallGenerator < ::Rails::Generators::Base
        include Rails::Generators::Migration

        desc "Installs the ECM CMS Navigation module"

        def generate_navigation
          generate 'ecm:cms_navigation:navigation'
        end
      end
    end
  end
end

