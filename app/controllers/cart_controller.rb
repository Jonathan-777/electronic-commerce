class CartController < ApplicationController
  def show
    @cart_products = Product.find(session[:cart] || [])
  end
  def add
    product = Product.find(params[:product_id])

    # Store in session cart (simple version)
    session[:cart] ||= []
    session[:cart] << product.id

    flash[:notice] = "#{product.name} added to cart!"
    redirect_back fallback_location: product_path(product)
  end
end
