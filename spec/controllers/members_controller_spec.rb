require 'spec_helper'

describe MembersController do
  render_views
  
  describe "GET 'index'" do
    
    before(:each) do
      @member = Factory(:member)
      second = Factory(:member, :name => "another")
      third = Factory(:member, :name => "yet another")
      @members = [@member, second, third]
    end
    
    it "should be successful" do
      get :index
      response.should be_success
    end
    
    it "should have the right title" do
      get :index
      response.should have_selector("title", :content => "Member List")
    end
    
    it "should have an element for each member" do
      get :index
      @members.each do |member|
        response.should have_selector("li", :content => member.name)
      end
    end
    
  end # GET 'index'
  
  describe "GET 'show'" do
    
    before(:each) do
      @member = Factory(:member)
    end
    
    it "should be successful" do
      get :show, :id => @member
      response.should be_success
    end
    
    it "should find the right member" do
      get :show, :id => @member
      assigns(:member).should == @member
    end
    
    it "should have the right title" do
      get :show, :id => @member
      response.should have_selector("title", :content => @member.name)
    end
    
    it "should show the member's loot entries" do
      le1 = Factory(:item, :member => @member, :name => "Sword")
      le2 = Factory(:item, :member => @member, :name => "Shield")
      get :show, :id => @member
      response.should have_selector("section.item", :content => le1.name)
      response.should have_selector("section.item", :content => le2.name)
    end
    
  end

end
