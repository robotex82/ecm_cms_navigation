require 'spec_helper'

describe "Basic navigation rendering" do
  describe "GET /basic_navigation" do   
    before do
      @navigation = FactoryGirl.create(:ecm_cms_navigation_navigation, :name => 'basic_navigation')
      @navigation_item = FactoryGirl.create(:ecm_cms_navigation_navigation_item, :name => 'Home', :url => '"/"', :key => 'home', :navigation => @navigation)
    end
    
    it "should have the correct response code" do
      get "/basic_navigation"
      response.status.should be(200)
    end
    
    it "should render correctly" do
      get "/basic_navigation"
      response.body.should match @navigation_item.name
    end    
  end
end
