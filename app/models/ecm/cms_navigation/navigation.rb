class Ecm::CmsNavigation::Navigation < ActiveRecord::Base
  # database sesttings
  self.table_name = 'ecm_cms_navigation_navigations'

  # associations
  has_many :navigation_items, :class_name =>  Ecm::CmsNavigation::NavigationItem,
                              :dependent  => :destroy
  
  # attributes
  attr_accessible :locale, :name
  
  # callbacks
  before_validation :downcase_name, :normalize_locale
  
  # friendly id
  extend FriendlyId
  friendly_id :name, :use => :slugged
  
  # validations
  validates :name, :presence => true, :uniqueness => { :scope => :locale }, :format => { :with => /[a-z\-]{1,}/i }
  validates :locale,  :inclusion => I18n.available_locales.map(&:to_s), :unless => Proc.new { |navigation| navigation.locale.blank? }

  # public methods
  def display_name
    prefix = "[#{self.locale}] " if self.locale.present?
    "#{prefix}#{self.name}"
  end  
  
  def to_s
    "#{self.locale}: #{self.name}"
  end  

  def downcase_name
    self.name.downcase! unless self.name.blank?
  end  
  
  def has_navigation_items?
    self.navigation_items.count > 0
  end  
  
  def normalize_locale
    self.locale = self.locale.to_s if self.locale.respond_to?(:to_s)
  end  
end
