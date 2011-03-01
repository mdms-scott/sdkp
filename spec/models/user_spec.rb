require 'spec_helper'

describe User do
  
  before(:each) do
    @attr = {
      :name => "Example User",
      :password => "foobar",
      :password_confirmation => "foobar"
    }
  end
  
  it "should create a new instance given valid attributes" do
    User.create!(@attr)
  end
  
  describe "name validations" do
  
    it "should require a name" do
      nameless_user = User.new(@attr.merge(:name => ""))
      nameless_user.should_not be_valid
    end
    
    it "should reject names that are too long" do
      long_name = "a" * 17
      long_name_user = User.new(@attr.merge(:name => long_name))
      long_name_user.should_not be_valid
    end
    
    it "should reject duplicate names" do
      User.create!(@attr)
      duplicate_user = User.new(@attr)
      duplicate_user.should_not be_valid
    end
    
  end # 'name validations'
  
  describe "password validations" do
    
    it "should require a password" do
      User.new(@attr.merge(:password => "", :password_confirmation => "")).should_not be_valid
    end
    
    it "should require a matching password confirmation" do
      User.new(@attr.merge(:password_confirmation => "barbaz")).should_not be_valid
    end
    
    it "should reject short passwords" do
      short = "a" * 4
      hash = @attr.merge(:password => short, :password_confirmation => short)
      User.new(hash).should_not be_valid
    end
    
    it "should reject long passwords" do
      long = "a" * 21
      hash = @attr.merge(:password => long, :password_confirmation => long)
      User.new(hash).should_not be_valid
    end
    
  end # 'password validations'
  
  describe "password encryption" do
    
    before(:each) do
      @user = User.create!(@attr)
    end
    
    it "should have a password hash attribute" do
      @user.should respond_to(:password_hash)
    end
    
    it "should set the password hash" do
      @user.password_hash.should_not be_blank
    end
    
    it "should have a password salt attribute" do
      @user.should respond_to(:password_salt)
    end
    
    it "should set the password salt" do
      @user.password_salt.should_not be_blank
    end
    
    describe "authenticate method" do
      
      it "should return nil on name/password mismatch" do
        wrong_password_user = User.authenticate(@attr[:name], "invalid")
        wrong_password_user.should be_nil
      end
      
      it "should return nil for a name with no user" do
        nonexistent = User.authenticate("Fred", @attr[:password])
        nonexistent.should be_nil
      end
      
      it "should return the user on name/password match" do
        matching_user = User.authenticate(@attr[:name], @attr[:password])
        matching_user.should == @user
      end
      
    end # 'authenticate method'
    
  end # 'password encryption'
  
end
