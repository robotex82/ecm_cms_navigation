module Ecm
  module CmsNavigation
    describe Navigation do
      subject { FactoryGirl.build(:ecm_cms_navigation_navigation) }
      
      # associations
      it { should have_many(:navigation_items) }
      
      # validations
      it { should validate_presence_of(:name) }
      
      it "should only accept available locales" do
        navigation = FactoryGirl.build(:ecm_cms_navigation_navigation, :locale => 'invalid')
        navigation.should_not be_valid      
      end 
      
      # friendly id
      it "should have a friendly id" do
        navigation = FactoryGirl.create(:ecm_cms_navigation_navigation, :name => 'This is a navigation that should have a friendly id!')
        navigation.to_param.should == 'this-is-a-navigation-that-should-have-a-friendly-id'
      end 
      
      # methods
    end
  end  
end  
