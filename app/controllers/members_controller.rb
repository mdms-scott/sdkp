class MembersController < ApplicationController
  
  before_filter :find_member, :except => ['index', 'new', 'create']
  
  respond_to :html, :json
  
  def index
    @title = "Member List"
    @members = Member.all
    respond_with @members
  end
  
  def show
    respond_with @member
  end
  
  def new
    @member = Member.new
    respond_with @member
  end
  
  def create
    @member = Member.new(params[:member])
    if @member.save
      flash[:notice] = "Successfully added a member."
      respond_with @member, :location => members_path
    else
      flash[:alert] = "Failed to add a new member."
      render :action => :new
    end
  end
  
  def edit
    respond_with @member
  end
  
  def update
    if @member.update_attributes(params[:member])
      flash[:notice] = "Successfully updated member information."
      respond_with @member, :location => members_path
    else
      flash[:alert] = "Failed to update member information."
      render :action => :edit
    end
  end
  
  def destroy
    flash[:notice] = "Successfully removed member." if @member.delete
    respond_with @member
  end
  
private
  def find_member
    @member = Member.find(params[:id])
  end
  
end
