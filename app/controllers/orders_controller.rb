class OrdersController < ApplicationController
  def new
    @pastry = Pastry.find(params[:pastry_id])
    @order = @pastry.orders.new
  end

  def create
    @pastry = Pastry.find(params[:pastry_id])
    @order = @pastry.orders.new(order_params)
    @order.user = current_user # sets user
    # @order.user_id = current_user.id --- same as above but both methods available
    if @order.save
      flash[:success] = "Thanks"
      logger.debug @order.inspect
      redirect_to order_path(@order) # sends to show page for order
      # try charge card here
      Stripe.api_key = Rails.application.secrets.stripe_secret_key

      Stripe::Charge.create(
        :amount => @pastry.price_in_pence,
        :currency => "gbp",
        :source => "@order.stripe_token", # obtained with Stripe.js
        :description => "Charge for #{@order.user.email}."
      )
    else
      flash[:error] = "error, try again"
      render :new
    end
  end

  def show
  end

  private
  def order_params
    params.require(:order).permit(:stripe_token)
  end
end
