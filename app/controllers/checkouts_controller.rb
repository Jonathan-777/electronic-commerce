class CheckoutsController < ApplicationController
  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)
    @order.user = nil # guest order

    if @order.save
      session[:cart] = [] # clear cart
      redirect_to order_success_path, notice: "Thank you for your purchase!"
    else
      flash.now[:alert] = "Checkout failed. Please check your details."
      render :new
    end
  end

  def success
  end

  private

  def order_params
    params.require(:order).permit(:first_name, :last_name, :address, :credit_card_number, :expiration_date, :cvv)
  end
end
