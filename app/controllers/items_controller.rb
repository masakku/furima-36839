class ItemsController < ApplicationController
  before_action :authenticate_user!, except: [:show, :index, :search]
  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def index
    @items = Item.all.order(created_at: 'DESC')
  end

  def new
    @item = Item.new
  end

  def create
    @item = Item.new(item_params)
    if @item.valid?
      @item.save
      redirect_to root_path
    else
      render :new
    end
  end

  def show
    @comments = @item.comments.includes(:user)
    @comment = Comment.new
  end

  def edit
    redirect_to root_path unless current_user.id == @item.user_id && @item.order.nil?
  end

  def update
    @item.update(item_params)
    if @item.update(item_params)
      redirect_to item_path
    else
      render :edit
    end
  end

  def destroy
    redirect_to root_path if @item.user_id == current_user.id && @item.destroy
  end

  def search
    if params[:q]&.dig(:name)
      squished_keywords = params[:q][:name].squish
      params[:q][:name_cont_any] = squished_keywords.split('')
    end
    @q = Item.ransack(params[:q])
    @items = @q.result
  end

  private

  def item_params
    params.require(:item).permit(:name, :info, :sales_status_id, :shopping_fee_status_id, :category_id, :prefecture_id,
                                 :scheduled_delivery_id, :price, :image).merge(user_id: current_user.id)
  end

  def set_item
    @item = Item.find(params[:id])
  end
end
