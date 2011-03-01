require 'spec_helper'

describe SessionsController do
  render_views
  
  describe "GET 'new'" do
    
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "Log in")
    end
    
  end # GET 'new'
  
  describe "POST 'create'" do
    
    describe "invalid login" do
      
      before(:each) do
        @attr = { :name => "Name", :password => "notpassword" }
      end
      
      it "should re-render the new page" do
        post :create, :session => @attr
        response.should render_template('new')
      end
      
      it "should have the right title" do
        post :create, :session => @attr
        response.should have_selector("title", :content => "Log in")
      end
      
      it "should have a flash message" do
        post :create, :session => @attr
        flash.now[:error].should =~ /invalid/i
      end
      
    end # 'invalid login'
    
    describe "valid login" do
      
      before(:each) do
        @user = Factory(:user)
        @attr = { :name => @user.name, :password => @user.password }
      end
        
      it "should log the user in" do
        post :create, @attr
        controller.current_user.should == @user
        controller.should be_signed_in
      end
      
      it "should redirect to the root path" do
        post :create, @attr
        response.should redirect_to(root_path)
      end

    end # 'valid login'
    
  end # POST 'create
  
  describe "DELETE 'destroy'" do
    
    it "should sign a user out" do
      test_sign_in(Factory(:user))
      delete :destroy
      controller.should_not be_signed_in
      response.should redirect_to(root_path)
    end
    
  end
  
end
