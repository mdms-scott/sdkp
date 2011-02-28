class StaticController < ApplicationController
  
  def home
    @members = Member.all
    @title = "List"
    
  end
  
end
