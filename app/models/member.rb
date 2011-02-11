# == Schema Information
# Schema version: 20110210220232
#
# Table name: members
#
#  id       :integer(4)      not null, primary key
#  name     :string(255)
#  pclass   :string(255)
#  position :integer(4)
#

class Member < ActiveRecord::Base
  
  PCLASSES = ['Warrior', 'Paladin', 'Death Knight', 'Rogue', 'Hunter', 'Mage', 'Warlock', 'Druid', 'Priest', 'Shaman']
  
  has_many :items
  
  def self.highest
    pos = Member.first.position
    Member.all.each do |member|
      if pos < member.position
        pos = member.position
      end
    end
    pos
  end
  
  def reposition(members)
    c_p = []
    members.each do |member|
      c_p << member.position
    end
    puts c_p
  end
  
end
