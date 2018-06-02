class StoreController < ApplicationController
  include SessionCounter

  def index
    @products = Product.order(:title)
    counter
  end
end
