require 'spec_helper'

describe Member do
  
  before(:each) do
    @attr = { :name => "Example Member" }
  end
  
  it "should create a new instance given valid attributes" do
    Member.create!(@attr)
  end
  
  it "should require a name" do
    nameless_member = Member.new(:name => "")
    nameless_member.should_not be_valid
  end
  
  it "should reject names that are too long" do
    long_name = "a" * 17
    long_name_member = Member.new(:name => long_name)
    long_name_member.should_not be_valid
  end
  
  it "should reject duplicate names" do
    Member.create!(@attr)
    duplicate_member = Member.new(@attr)
    duplicate_member.should_not be_valid
  end
  
  it "should place itself at the end of the list" do
    first_member = Member.create(:name => "First")
    second_member = Member.create!(:name => "Second")
    second_member.position.should == Member.highest

  end
  
  it "should not have a position equal to another member" do
    first_member = Member.create!(:name => "First")
    second_member = Member.create!(:name => "Second")
    second_member.position.should_not == first_member.position
  end
  
  describe "methods" do
    
    before(:each) do
      @member = Member.create!(@attr)
    end
    
    it "should have a 'highest' method" do
      Member.should respond_to(:highest)
    end
    
    it "should have an 'initial' method" do
      @member.should respond_to(:initial)
    end
    
  end # 'methods'
  
  describe "list manipulation" do
    
    before(:each) do
      @member = Member.create!(@attr)
      @member_two = Member.create!(:name => "Two")
      @member_three = Member.create!(:name => "Three")
    end
    
    it "should have a 'reposition' method" do
      @member.should respond_to(:reposition)
    end
    
    it "should go to the end of the list when it recieves an item" do
      members = Member.all
      @member.reposition(members)
      @member.position.should == Member.highest
    end
    
    it "should have an 'uplist' method" do
      @member.should respond_to(:uplist)
    end
    
    it "should be moved up the list by one" do
      @member_two.uplist(@member_two)
      @member_two.reload
      @member.reload
      @member_two.position.should < @member.position
    end
    
    it "should have a 'downlist' method" do
      @member.should respond_to(:downlist)
    end
    
    it "should move down the list by one" do
      @member_two.downlist(@member_two)
      @member_two.reload
      @member_three.reload
      @member_two.position.should > @member_three.position
    end
    
  end # 'list manipulation'
  
end
