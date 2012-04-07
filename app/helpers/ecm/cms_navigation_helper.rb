module Ecm::CmsNavigationHelper
  def cms_render_navigation(name, options = {})
    navigation = Navigation.where(:name => name).first
    
    return I18n.t('ecm.navigation.navigation_not_found', :name => name) unless navigation
    
    options[:items] = []
    navigation.navigation_items.roots.all.each do |navigation_item|
      options[:items] << build_navigation(navigation_item)  
    end
    
    return I18n.t('ecm.navigation.navigation_empty', :name => name) if items.empty?
    
    options[:items] = items
    
    render_navigation(options)
  end
  
  def build_navigation(navigation_item)
    if navigation_item.children.count > 0
      items = []
      navigation_item.children.each do |child|
        items << build_navigation(child)
      end
      return {:key => navigation_item.key, :name => navigation_item.name, :url => eval(navigation_item.url), :items => items }
    else  
      return {:key => navigation_item.key, :name => navigation_item.name, :url => eval(navigation_item.url) }
    end
  end
end
