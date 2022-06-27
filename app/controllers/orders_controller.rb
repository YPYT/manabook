class OrdersController < ApplicationController
  before_action :set_listing
  before_action :authenticate_user!  

  def show
    
  end

  def confirm
   
  end

  def listing_order
    @order = Order.create(
      listing_id: @listing.id,
      seller_id: @listing.user_id,
      buyer_id: current_user.id
    )

    @listing.update(sold: true)
    redirect_to listing_order_success_path
  end


  private
  def set_listing
    @listing = Listing.find(params[:listing_id])
  end

  def order_params
    params.require(:order).merge(user_id: current_user.id, listing_id: params[:listing_id])
  end

end
