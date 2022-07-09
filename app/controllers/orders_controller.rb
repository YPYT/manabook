class OrdersController < ApplicationController
  before_action :set_listing, only: [ :success, :confirm, :listing_order ]
  before_action :authenticate_user!  

  def success
  end

  def confirm
  end

  def listing_order
    # Create an instance (@order) of the Order model and store the following data users want to store in the database.
    @order = Order.create(
      # @listing is created by set_listing method in the private area
      # The id from @listing is retrieved and stored in the new @order instance as a referenced listing_id
      listing_id: @listing.id,
      # The user_id from @listing is retrieved and stored in the new @order instance as a referenced seller_id
      seller_id: @listing.user_id,
      # The current_user's id is retrieved and stored in the new @order instance as a referenced buyer_id
      buyer_id: current_user.id
    )

    # The @listing updates when the listing_order called, and change the sold attribute to true (the default is false)
    @listing.update(sold: true)
    redirect_to listing_order_success_path
  end

  def bought
    # It retrieves the bought_orders belonging to the current user through the buyer_id in the Order model.
    @bought_items = current_user.bought_orders
  end

  def sold
    #It retrieves the sold_orders belonging to the current user through the seller_id in the Order model.
    @sold_items = current_user.sold_orders
  end


  private
  def set_listing
    # Retrieve only one record with the :listing_id received in params from Listing model and assign to @listing instance variable.
    @listing = Listing.find(params[:listing_id])
  end

  def order_params
    params.require(:order).merge(user_id: current_user.id, listing_id: params[:listing_id])
  end

end
