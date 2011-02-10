# == Schema Information
# Schema version: 20110210210202
#
# Table name: members
#
#  id     :integer(4)      not null, primary key
#  name   :string(255)
#  link   :string(255)
#  pclass :string(255)
#

class Member < ActiveRecord::Base
  
  PCLASSES = ['Warrior', 'Paladin', 'Death Knight', 'Rogue', 'Hunter', 'Mage', 'Warlock', 'Druid', 'Priest', 'Shaman']
  
  has_many :items
  
end
