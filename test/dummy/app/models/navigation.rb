class Navigation < ActiveRecord::Base
  has_many :navigation_items, :dependent => :destroy
  
  validates :name, :presence => true, :uniqueness => { :scope => :locale }, :format => { :with => /[a-z\-]{1,}/i }
  validates :locale,  :inclusion => I18n.available_locales.map(&:to_s), :unless => Proc.new { |navigation| navigation.locale.blank? }

  def to_s
    "#{self.locale}: #{self.name}"
  end  
  
  before_validation :downcase_name
  
  def downcase_name
    self.name.downcase!
  end  
  
  def has_navigation_items?
    self.navigation_items.count > 0
  end  
end
