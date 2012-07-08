class Ecm::CmsNavigation::Navigation < ActiveRecord::Base
  self.table_name = 'ecm_cms_navigation_navigations'

  has_many :navigation_items, :dependent => :destroy, :class_name => 'Ecm::CmsNavigation::NavigationItem'
  
  validates :name, :presence => true, :uniqueness => { :scope => :locale }, :format => { :with => /[a-z\-]{1,}/i }
  validates :locale,  :inclusion => I18n.available_locales.map(&:to_s), :unless => Proc.new { |navigation| navigation.locale.blank? }

  attr_accessible :locale, :name
  
  def to_s
    "#{self.locale}: #{self.name}"
  end  
  
  before_validation :downcase_name
  
  def downcase_name
    self.name.downcase! unless self.name.blank?
  end  
  
  def has_navigation_items?
    self.navigation_items.count > 0
  end  
end
