# == Schema Information
# Schema version: 20110212201246
#
# Table name: users
#
#  id            :integer(4)      not null, primary key
#  name          :string(255)
#  password_hash :string(255)
#  password_salt :string(255)
#  created_at    :datetime
#  updated_at    :datetime
#

class User < ActiveRecord::Base
  
  attr_accessible :name, :password, :password_confirmation
  
  attr_accessor :password
  before_save :encrypt_password
  
  validates :password, :presence => true, :confirmation => true, :length => { :within => 5..20 }
  validates :name, :presence => true, :length => { :within => 5..16 }, :uniqueness => { :case_sensitive => false }
  
  def self.authenticate(name, password)
    user = find_by_name(name)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
  
  def encrypt_password
    if password.present?
      self.password_salt = BCrypt::Engine.generate_salt
      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
    end
  end
end
