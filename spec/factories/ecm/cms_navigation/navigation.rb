FactoryGirl.define do
  factory :ecm_cms_navigation_navigation, :class => Ecm::CmsNavigation::Navigation do
    locale I18n.locale
    name 'main'
  end
end
