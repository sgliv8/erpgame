class WelcomeController < ApplicationController
  def index
  end

  def products
  	@products = Product.all
  end

  def roles
  end

  def home
  end

  def play
  end

  def bom
  end
end
