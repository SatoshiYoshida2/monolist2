class ItemsController < ApplicationController
  before_action :logged_in_user , except: [:show]
  before_action :set_item, only: [:show]

  def index
    @items = Item.page(params[:page])
  end

  def new
    if params[:q]
      response = RakutenWebService::Ichiba::Item.search(
        keyword: params[:q],
        #imageFlag: 1,
      )
      #@items = response.first(20)
      @items = Kaminari.paginate_array(response.first(100)).page(params[:page]).per(24)
    end
  end

  def show
  end

  private
  def set_item
    @item = Item.find(params[:id])
  end
end
