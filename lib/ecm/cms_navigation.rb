module Ecm
  module CmsNavigation
    class Engine < Rails::Engine
      config.to_prepare do
        ApplicationController.helper(Ecm::CmsNavigationHelper)
      end  
    end
  end  
end
