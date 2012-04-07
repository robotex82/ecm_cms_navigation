ActiveAdmin.register Ecm::CmsNavigation::Navigation do
  menu :label => Ecm::CmsNavigation::Navigation.model_name.human(:count => 10)

  form do |f|
    f.inputs do
      f.input :locale, :as => :select, :collection => I18n.available_locales.map(&:to_s)
      f.input :name
    end
    f.buttons
  end
  
  index :title => Ecm::CmsNavigation::Navigation.model_name.human(:count => 10) do
    column :locale
    column :name
    default_actions
  end
  
  
  show :title => :name do
    attributes_table do
      row :locale
      row :name
    end
    
    panel Ecm::CmsNavigation::NavigationItem.model_name.human(:count => 10) do
      if ecm_cms_navigation_navigation.has_navigation_items?
        table_for ecm_cms_navigation_navigation.navigation_items.order(:lft) do
          column  do |navigation_item|
            link_to('&#9650;'.html_safe, move_up_admin_ecm_cms_navigation_navigation_item_path(navigation_item), :class => "arrow") if navigation_item.left_sibling
          end
          column  do |navigation_item|
            link_to('&#9660;'.html_safe, move_down_admin_ecm_cms_navigation_navigation_item_path(navigation_item), :class => "arrow") if navigation_item.right_sibling
          end
          column Ecm::CmsNavigation::NavigationItem.human_attribute_name(:indented_name), :indented_name
          column Ecm::CmsNavigation::NavigationItem.human_attribute_name(:url), :url
          column Ecm::CmsNavigation::NavigationItem.human_attribute_name(:key), :key
          column Ecm::CmsNavigation::NavigationItem.human_attribute_name(:options), :options
          column do |navigation_item|
            link_to I18n.t('active_admin.view'), admin_ecm_cms_navigation_navigation_item_path(navigation_item), :class => "member_link view_link"
          end
        end
      else
        div do
          I18n.t('ecm.navigation.no_subitems')
        end
      end   
    end
  end
end
