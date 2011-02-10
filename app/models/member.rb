# == Schema Information
# Schema version: 20110210210202
#
# Table name: members
#
#  id    :integer(4)      not null, primary key
#  name  :string(255)
#  link  :string(255)
#  class :string(255)
#

class Member < ActiveRecord::Base
  
  CLASSES = ['Warrior', 'Paladin', 'Death Knight', 'Rogue', 'Hunter', 'Mage', 'Warlock', 'Druid', 'Priest', 'Shaman']
  
end
