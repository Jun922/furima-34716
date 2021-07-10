class OrdersController < ApplicationController

  def index
    @item = Item.find(params[:item_id])
    @order_card = OrderCard.new
  end

  def create
    @item = Item.find(params[:item_id])
    @order_card = OrderCard.new(order_params)
    if @order_card.valid?
      pay_item
      @order_card.save
      return redirect_to root_path
    else
      render "orders/index"
    end
  end

  private
  def order_params
    params.require(:order_card).permit(:postal_code, :prefecture_id, :city, :address, :building, :phone_number).merge(item_id: params[:item_id], user_id: current_user.id, token: params[:token])
  end

  def pay_item
    Payjp.api_key = ENV["PAYJP_SECRET_KEY"]  # 自身のPAY.JPテスト秘密鍵を記述しましょう
    Payjp::Charge.create(
      amount: @item.price,
      card: order_params[:token],
      currency: 'jpy'
    )
  end
end
