# == Schema Information
# Schema version: 20110210220232
#
# Table name: items
#
#  id        :integer(4)      not null, primary key
#  name      :string(255)
#  spec      :string(255)
#  link      :string(255)
#  boss      :string(255)
#  member_id :integer(4)
#  date      :datetime
#

class Item < ActiveRecord::Base
  
  belongs_to :member
  
  SPECS = ["Main", "Off"]
  
  BOSSES = ["Magmaw", "Omnitron Defense System", "Ascendant Council", "Cho'Gal", "Halfus Wyrmbreaker", "Valiona & Theralion", "Maloriak", "Atramedes", "Chimaeron", "Nefarian", "Lady Sinestra"]
  
end
