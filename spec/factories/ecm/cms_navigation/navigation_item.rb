FactoryGirl.define do
  factory :ecm_cms_navigation_navigation_item, :class => Ecm::CmsNavigation::NavigationItem do
    name 'Home'
    url '"/en"'
    key 'home'
    association :navigation, :factory => :ecm_cms_navigation_navigation
  end
end
