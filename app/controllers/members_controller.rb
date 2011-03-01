class MembersController < ApplicationController
  
  before_filter :find_member, :except => ['index', 'new', 'create']
  before_filter :authenticate, :except => ['index', 'show']
  
  respond_to :html, :json
  

  
  def index
    @title = "Member List"
    @members = Member.all
  end
  
  def show
    @title = "#{@member.name}'s Loot History"
    respond_with @member
  end
  
  def new
    @title = "Creating a new member"
    @member = Member.new
    respond_with @member
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
      flash[:success] = "Successfully added a member."
      respond_with @member, :location => members_path
    else
      flash[:alert] = "Failed to add a new member."
      @title = "Creating a new member"
      render :action => :new
    end
  end
  
  def edit
    @title = "Editing #{@member.name}'s information"
    respond_with @member
  end
  
  def update
    if @member.update_attributes(params[:member])
      flash[:success] = "Successfully updated member information."
      respond_with @member, :location => member_path(@member)
    else
      flash[:alert] = "Failed to update member information."
      @title = "Editing member's information"
      render :action => :edit
    end
  end
  
  def destroy
    @member.destroy
    flash[:notice] = "Successfully removed member." if @member.delete
    respond_with @member, :location => members_path
  end
  
  def move_up_list
    @member.uplist(@member)
    @member.save!
    redirect_to root_url
  end
  
  def move_down_list
    @member.downlist(@member)
    @member.save!
    redirect_to root_url
  end
  
private
  def find_member
    @member = Member.find(params[:id])
  end
  
end
