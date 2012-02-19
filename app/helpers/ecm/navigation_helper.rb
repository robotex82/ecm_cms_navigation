module Ecm::NavigationHelper
  def cms_render_navigation(name)
    navigation = Navigation.where(:name => name).first
    
    return "#{name} navigation not found." unless navigation
    
    items = []
    navigation.navigation_items.roots.all.each do |navigation_item|
      items << build_navigation(navigation_item)  
    end
    
    return "#{name} navigation is empty." if items.empty?
    puts items
    
    if navigation.level.empty?
      render_navigation :items => items, :expand_all => navigation.expand
    else
      render_navigation :items => items, :expand_all => navigation.expand, :level => eval(navigation.level)
    end  
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
