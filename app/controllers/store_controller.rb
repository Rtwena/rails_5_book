class StoreController < ApplicationController
  include SessionCounter
  include CurrentCart
  before_action :set_cart, :counter

  def index
    @products = Product.order(:title)
  end
end
