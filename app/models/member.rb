# == Schema Information
# Schema version: 20110210210202
#
# Table name: members
#
#  id         :integer(4)      not null, primary key
#  name       :string(255)
#  link       :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class Member < ActiveRecord::Base
end
