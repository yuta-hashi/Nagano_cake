class Admin::ItemsController < ApplicationController
  def index
    @items = Item.all
  end

  def new
    @item = Item.new
    @genres = Genre.all
  end

  def create
    @item = Item.new(item_params)
    @item.save
    redirect_to admin_items_path
  end

  def show
  end

  def edit
  end

  def update
  end

  # storng parameter
  private

  def item_params
    params.require(:items).permit(:genre, :name, :image, :introduction, :price, :is_active)
  end
end
