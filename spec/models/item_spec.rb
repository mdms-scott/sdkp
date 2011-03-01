require 'spec_helper'

describe Item do
  
  before(:each) do
    @attr = {
      :name => "Test Item",
      :boss => "Magmaw",
      :itemid => "13579",
      :heroicid => "246810",
      :heroic => false
    }
  end
  
  it "should create a new instance given valid attributes" do
    Item.create!(@attr)
  end
  
  describe "attributes" do
    
    before(:each) do
      @item = Item.create!(@attr)
    end
    
    it "should have a name attribute" do
      @item.should respond_to(:name)
    end
    
    it "should have a boss attribute" do
      @item.should respond_to(:boss)
    end
    
    it "should have an item id" do
      @item.should respond_to(:itemid)
    end
      
  end # 'attributes'
  
  describe "validations" do
    
    it "should require a name" do
      nameless_item = Item.new(@attr.merge(:name => ""))
      nameless_item.should_not be_valid
    end
    
    it "should reject duplicate items" do
      Item.create!(@attr)
      duplicate_item = Item.new(@attr)
      duplicate_item.should_not be_valid
    end
    
    it "should require a boss" do
      no_boss_item = Item.new(@attr.merge(:boss => ""))
      no_boss_item.should_not be_valid
    end
    
    it "should require a boss from the list" do
      wrong_boss_item = Item.new(@attr.merge(:boss => "Aerfalle"))
      wrong_boss_item.should_not be_valid
    end
    
    it "should require an item id" do
      no_itemid_item = Item.new(@attr.merge(:itemid => ""))
      no_itemid_item.should_not be_valid
    end
    
  end # 'validations'
  
end
