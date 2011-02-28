require 'spec_helper'

describe StaticController do
  render_views
  
  describe "GET 'home'" do
    
    describe "when not signed in" do
      
      before(:each) do
        get :home
      end
      
      it "should be successful" do
        response.should be_success
      end
      
      it "should have the right title" do
        response.should have_selector("title", :content => "Lazy Eights Suicide Kings | List")
      end
      
    end # 'not signed in'
    
    describe "when signed in" do
      
      before(:each) do
        @user = 
      
    end # 'signed in'
    
  end

end
