# == Schema Information
# Schema version: 20110212201246
#
# Table name: items
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  boss       :string(255)
#  itemid     :integer(4)
#  heroicid   :integer(4)
#  heroic     :boolean(1)
#  created_at :datetime
#  updated_at :datetime
#

class Item < ActiveRecord::Base
  
  cattr_reader :per_page
  
  @@per_page = 10
  
  BOSSES = ["Magmaw", "Omnitron Defense System", "Ascendant Council", "Cho'Gal", "Halfus Wyrmbreaker", "Valiona & Theralion", "Maloriak", "Atramedes", "Chimaeron", "Nefarian", "Lady Sinestra", "Conclave of Wind", "Al'Akir", "Trash Epic", "Tier Token"]
  
  validates :name, :uniqueness => { :case_sensitive => false }, :presence => true
  validates :boss, :presence => true, :inclusion => { :in => BOSSES }
  validates :itemid, :presence => true
  
  
  
  
end
