class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:index]

  def index
    @item = Item.all.order('created_at DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.save
      redirect_to root_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def item_params
    params.require(:item).permit(:item_name, :item_description, :price, :category_id, :item_status_id, :delivery_price_id,
                                 :prefecture_id, :delivery_criterion_id, :image).merge(user_id: current_user.id)
  end
end
