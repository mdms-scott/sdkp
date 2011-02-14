# == Schema Information
# Schema version: 20110210220232
#
# Table name: members
#
#  id       :integer(4)      not null, primary key
#  name     :string(255)
#  pclass   :string(255)
#  position :integer(4)      default(0)
#

class Member < ActiveRecord::Base
  
  has_many :items, :dependent => :destroy
  
  after_create :initial
  
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_uniqueness_of :name, :on => :create, :message => "must be unique"
  validates_presence_of :pclass, :on => :create, :message => "must select a class"

  PCLASSES = ['Warrior', 'Paladin', 'Death Knight', 'Rogue', 'Hunter', 'Mage', 'Warlock', 'Druid', 'Priest', 'Shaman']
  
  # Finds and returns the highest position any member currently holds
  def self.highest
    pos = Member.first.position
    Member.all.each do |member|
      if pos < member.position
        pos = member.position
      end
    end
    pos
  end
  
  # Upon creation of a new member, adds member to the end of the list
  def initial
    self.position = Member.highest + 1
    self.save
  end
  
  # Puts a member at the end of the list, and reassigns all other members positions
  def reposition(members)
    if Member.all.empty?
      self.position = 1
      self.save
    else
      high = Member.highest
      current = self.position
      Member.all.each do |member|
        if member.position > current
          member.position = member.position - 1
          member.save
        end
      end
      self.position = high
      self.save
    end
  end
  
  # Manually moves a member up the list by one position
  def uplist(member)
    pos = member.position
    unless pos == 1  
      you = Member.find_by_position(pos - 1)
      member.position, you.position = you.position, member.position
      member.save
      you.save
    end
  end
  
  # Manually moves a member down the list by one position
  def downlist(member)
    
  end
  
end
