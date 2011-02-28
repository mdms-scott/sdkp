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
    
  end # GET 'show'
  
  describe "GET 'new'" do
    
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
    end
    
    it "should be successful" do
      get :new
      response.should be_success
    end
    
    it "should have the right title" do
      get :new
      response.should have_selector("title", :content => "Creating a new member")
    end
    
  end # GET 'new'
  
  describe "POST 'create'" do
    
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
    end
    
    describe "failure" do
      
      before(:each) do
        @attr = { :name => "", :pclass => "" }
      end
      
      it "should not create a member" do
        lambda do
          post :create, :member => @attr
        end.should_not change(User, :count)
      end
      
      it "should have the right title" do
        post :create, :user => @attr
        response.should have_selector("title", :content => "Creating a new member")
      end
      
      it "should render the 'new' page" do
        post :create, :user => @attr
        response.should render_template('new')
      end
      
    end # 'failure'
    
    describe 'success' do
      
      before(:each) do
        @attr = { :name => "New Member", :pclass => "Warrior" }
      end
      
      it "should create a member" do
        lambda do
          post :create, :member => @attr
        end.should change(Member, :count).by(1)
      end
      
      it "should redirect to the member index page" do
        post :create, :member => @attr
        response.should redirect_to(members_path)
      end
      
      it "should place the member at the bottom of the list" do
        post :create, :member => @attr
        @member = Member.first
        @member.position.should == Member.highest
      end
      
      it "should display a successful creation flash" do
        post :create, :member => @attr
        flash[:success].should =~ /successfully added a member/i
      end
      
    end # 'success'
    
  end # POST 'create'
  
  describe "GET 'edit'" do
    
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @member = Factory(:member)
    end
    
    it "should be successful" do
      get :edit, :id => @member
      response.should be_success
    end
    
    it "should have the right title" do
      get :edit, :id => @member
      response.should have_selector("title", :content => "Editing #{@member.name}'s information")
    end
    
  end # GET 'edit'
  
  describe "PUT 'update'" do
    
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @member = Factory(:member)
    end
    
    describe "failure" do
      
      before(:each) do
        @attr = { :name => "", :pclass => "" }
      end
      
      it "should render the edit page" do
        put :update, :id => @member, :member => @attr
        response.should render_template('edit')
      end
      
      it "should have the right title" do
        put :update, :id => @member, :member => @attr
        response.should have_selector("title", :content => "Editing member's information")
      end
      
    end # 'failure'
    
    describe "success" do
      
      before(:each) do
        @attr = { :name => "New Member", :pclass => 'Paladin' }
      end
      
      it "should change the member's attributes" do
        put :update, :id => @member, :member => @attr
        @member.reload
        @member.name.should == @attr[:name]
        @member.pclass.should == @attr[:pclass]
      end
      
      it "should redirect to the member show page" do
        put :update, :id => @member.id, :member => @attr
        response.should redirect_to(member_path(@member))
      end
      
      it "should have a flash message" do
        put :update, :id => @member, :member => @attr
      end
      
    end # 'success'
    
  end # PUT 'update'
  
  describe "DELETE 'destroy'" do
    
    before(:each) do
      @user = Factory(:user)
      @member = Factory(:member)
      test_sign_in(@user)
    end

    it "should destroy the user" do
      lambda do
        delete :destroy, :id => @member
      end.should change(Member, :count).by(-1)
    end
    
    it "should redirect to the users page" do
      delete :destroy, :id => @member
      response.should redirect_to(members_path)
    end
        
  end # DELETE 'destroy'
  
  describe "position actions" do
    
    before(:each) do
      @user = Factory(:user)
      test_sign_in(@user)
      @member = Factory(:member)
      @other_member = Factory(:member, :name => "Other Member")
    end
    
    describe "move up list" do
      
      before(:each) do
        @member.downlist(@member)
      end
      it "should move the user up the list" do
        post :move_up_list, :id => @member
        @member.position.should == @other_member.position - 1
      end
    end # 'move up list'
    
    describe "move down list" do
      lambda do
        post :move_down_list, :id => @member
        @member.position.should == @other_member.position + 1
      end
    end # 'move down list'
    
  end # 'position actions'
  
  describe "authentication for new, create, edit, update, and delete pages" do
    
    before(:each) do
      @member = Factory(:member)
      @user = Factory(:user)
    end
    
    describe "when not signed in" do
      
      it "should deny access to 'new'" do
        get :new
        response.should redirect_to(log_in_path)
      end
      
      it "should deny access to 'create'" do
        post :create
        response.should redirect_to(log_in_path)
      end
      
      it "should deny access to 'edit'" do
        get :edit, :id => @member
        response.should redirect_to(log_in_path)
      end
      
      it "should deny access to 'update'" do
        put :update, :id => @member, :member => {}
        response.should redirect_to(log_in_path)
      end
      
      it "should deny access to 'destroy'" do
        delete :destroy, :id => @member
        response.should redirect_to(log_in_path)
      end
      
    end # 'not signed in'
    
  end # 'authentication'

end
