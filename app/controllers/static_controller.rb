class StaticController < ApplicationController
  
  def home
    @members = Member.all
    
  end
  
end
