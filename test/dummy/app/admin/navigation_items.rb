include ActionView::Helpers::FormOptionsHelper
include CollectiveIdea::Acts::NestedSet::Helper 

ActiveAdmin.register NavigationItem do
  menu :label => I18n.t('activerecord.pluralized_models.navigation_item')

  member_action :move_up do
    @navigation_item = NavigationItem.find(params[:id])
    
    unless @navigation_item.left_sibling
      redirect_to :back, :notice => I18n.t('awesome_nested_set.illegal_move_up', :resource => @navigation_item.class.human_name ) 
      return
    end  
    
    @navigation_item.move_left
    redirect_to :back, :notice => I18n.t('awesome_nested_set.moved_up', :resource => @navigation_item.class.human_name )
  end

  member_action :move_down do
    @navigation_item = NavigationItem.find(params[:id])
    
    unless @navigation_item.right_sibling
      redirect_to :back, :notice => I18n.t('awesome_nested_set.illegal_move_down', :resource => @navigation_item.class.human_name ) 
      return
    end  
    
    @navigation_item.move_right
    redirect_to :back, :notice => I18n.t('awesome_nested_set.moved_down', :resource => @navigation_item.class.human_name )
  end

  form do |f|
    f.inputs do
      f.input :navigation, :as => :select, :collection => options_from_collection_for_select(Navigation.all, :id, :to_s)
      f.input :parent, :as => :select, :collection => nested_set_options(NavigationItem, f.object) { |ni| "#{'&#160;&#160;&#160;&#160;' * ni.level} |--#{ni.name}".html_safe }
      f.input :name
      f.input :url
      f.input :key
      f.input :options
    end
    f.buttons
  end
  
  index :title => I18n.t('activerecord.pluralized_models.navigation_item') do
    column  do |navigation_item|
      link_to('&#9650;'.html_safe, move_up_admin_navigation_item_path(navigation_item), :class => "arrow") if navigation_item.left_sibling
    end
    column  do |navigation_item|
      link_to('&#9660;'.html_safe, move_down_admin_navigation_item_path(navigation_item), :class => "arrow") if navigation_item.right_sibling
    end
    column :navigation do |navigation_item|
      link_to navigation_item.navigation, admin_navigation_path(navigation_item.navigation)
    end
    column :indented_name
    column :url
    column :key
    column :options
    default_actions
  end
  
  show :title => :name do
    attributes_table do
      row :navigation do |navigation_item|
        link_to navigation_item.navigation, admin_navigation_path(navigation_item.navigation)
      end
      row :parent do |navigation_item|
        link_to_if navigation_item.parent, navigation_item.parent, admin_navigation_item_path(navigation_item.parent)
      end
      row :name
      row :url
      row :key
      row :options
    end
  end
end
