class ProductsController < ApplicationController
  #before_action :set_product, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!
  load_and_authorize_resource
  respond_to :html

  def index
    @products = Product.all
    respond_with(@products)
  end

  def show
    respond_with(@product)
  end

  def new
    #@product = current_user.products.build
    respond_with(@product)
  end

  def edit
  end

  def create
    #@product = current_user.products.build(product_params)
    @product.save
    flash[:notice] = 'Product was successfully created.'
    respond_with(@product)
  end

  def update
    @product.update(product_params)
    flash[:notice] = 'Product was successfully updated.'
    respond_with(@product)
  end

  def destroy
    @product.destroy
    flash[:notice] = 'Product was successfully deleted.'
    respond_with(@product)
  end

  private
    # def set_product
    #   @product = Product.find(params[:id])
    # end

    def product_params
      params.require(:product).permit(:name, :description, :user_id, :image)
    end
end
