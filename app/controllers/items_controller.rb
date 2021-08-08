class ItemsController < ApplicationController
  before_action :find_item, only: %i[show edit update destroy upvote]
  before_action :admin?, only: %i[edit]
  skip_before_action :verify_authenticity_token
  def index
    @items = Item.all.order(:votes_count).order(:id).includes(:image)
  end

  def new
    @item = Item.new
  end

  def show
    render body: 'Page not found', status: 404 unless @item
  end

  def edit
    render body: 'Page not found', status: 404 unless @item
  end

  def update
    if @item.update(items_params)
      redirect_to item_path
    else
      flash[:error] = 'Please fii all fields correctly'
      render json: item.errors, status: :unprocessable_entity
    end
  end

  def destroy
    if @item.destroy
      # redirect_to items_path
      render json: { success: true }
    else
      flash[:error] = 'Item was deleted'
      # render json: item.error, status: :unprocessable_entity
    end
  end

  def create
    @item = Item.create(items_params)
    if @item.persisted?
      flash[:success] = 'All correct'
      redirect_to items_path
    else
      flash.now[:error] = 'Please fii all fields correctly'
      render :new
    end
  end

  def upvote
    @item.increment! :votes_count
    redirect_to items_path
  end

  def expensive
    @items = Item.where('price > 50')
    render :index
  end
  private
  def items_params
    params.require(:item).permit(:name, :price, :description)
  end

  def find_item
    @item = Item.where(id: params[:id]).first
  end

end
