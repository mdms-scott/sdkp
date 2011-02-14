class ItemsController < ApplicationController

  before_filter :find_item, :except => ['index', 'new', 'create']

  respond_to :html, :json
  
  load_and_authorize_resource

  def index
    @title = "All Loot Entries"
    @members = Member.all
    @items = Item.paginate :page => params[:page], :order => 'date DESC'
  end

  def show
    respond_with @item
  end

  def new
    @item = Item.new
    respond_with @item
  end

  def create
    @item = Item.new(params[:item])
    if @item.save
      unless @item.spec
        @item.member.reposition(Member.all)
      end
      flash[:notice] = "Successfully added a loot entry."
      redirect_to root_url
    else
      flash[:alert] = "Failed to add a new loot entry."
      render :action => :new
    end
  end

  def edit
    respond_with @item
  end

  def update
    if @item.update_attributes(params[:item])
      flash[:notice] = "Successfully updated the loot entry."
      respond_with @item, :location => items_path
    else
      flash[:alert] = "Failed to update the loot entry."
      render :action => :edit
    end
  end

  def destroy
    @item.destroy
    flash[:notice] = "Successfully removed loot entry." if @item.delete
    respond_with @item
  end

private
  def find_item
    @item = Item.find(params[:id])
  end

end
