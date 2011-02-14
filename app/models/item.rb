# == Schema Information
# Schema version: 20110210220232
#
# Table name: items
#
#  id        :integer(4)      not null, primary key
#  name      :string(255)
#  spec      :boolean(1)
#  link      :string(255)
#  boss      :string(255)
#  member_id :integer(4)
#  date      :datetime
#

class Item < ActiveRecord::Base
  
  belongs_to :member
  
  cattr_reader :per_page
  
  @@per_page = 10
  
  validates_presence_of :member_id, :on => :create, :message => "Loot entries must be assigned to a member"
  validates_presence_of :name, :on => :create, :message => "can't be blank"
  validates_presence_of :boss, :on => :create, :message => "can't be blank"
  
  BOSSES = ["Magmaw", "Omnitron Defense System", "Ascendant Council", "Cho'Gal", "Halfus Wyrmbreaker", "Valiona & Theralion", "Maloriak", "Atramedes", "Chimaeron", "Nefarian", "Lady Sinestra", "Conclave of Wind", "Al'Akir", "Trash Epic"]
  
  
end
