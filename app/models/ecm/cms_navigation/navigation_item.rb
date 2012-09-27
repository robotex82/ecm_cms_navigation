class Ecm::CmsNavigation::NavigationItem < ActiveRecord::Base
  # database sesttings
  self.table_name = 'ecm_cms_navigation_navigation_items'
  
  # associations
  belongs_to :navigation, :class_name => Ecm::CmsNavigation::Navigation
  
  # attributes
  attr_protected :lft, :rgt  
  
  # awesome nested set
  acts_as_nested_set :dependent => :destroy, :counter_cache => :children_count, :scope => :navigation_id
   
  # callbacks
  before_validation :set_navigation, :if => Proc.new { |navigation_item| navigation_item.child? }
  after_save :update_children_navigations!
  
  # default_scope
  default_scope :order => [:navigation_id, :lft]
  
#  # friendly id
#  extend FriendlyId
#  friendly_id :name, :use => :slugged
  
  # validations
  validates :name, :presence => true
  validates :url, :presence => true
  validates :key, :presence => true
  
  # public methods
  
  def indented_name
    "#{'&#160;&#160;&#160;&#160;' * self.level} |--#{self.name}".html_safe
  end  

  def set_navigation
    self.navigation = self.parent.navigation
  end
  
  def set_navigation!
    self.set_navigation
    self.save!
  end
  
  def to_s
    self.name
  end  
  
  def update_children_navigations!
    self.children.map(&:"set_navigation!")
  end
end
