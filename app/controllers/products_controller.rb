class ProductsController < ApplicationController
  before_action :find_product, only: [:show]
  def index

    @products = Product.all.select(:id, :name, :description)

    render json: @products

  end

  def show
    render json: @product, :include => :variants
  end

  private

    def find_product
      @product = Product.find(params[:id])
    end

end
