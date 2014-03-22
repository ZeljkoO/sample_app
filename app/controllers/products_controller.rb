class ProductsController < ApplicationController

  before_filter :signed_in_user

  def new
    @product = Product.new
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find(params[:id])
  end

  def edit
    @product = Product.find(params[:id])
  end

  def update
    @product = Product.find(params[:id])

    if @product.update_attributes(params[:product])
      flash[:success] = "Update successful!"
      redirect_to products_path
    else
      render 'edit'
    end
  end

  def destroy
    @product = Product.find(params[:id])
    @product.destroy
    flash[:success] = "Product destroyed."
    redirect_to products_path
  end

  def create
    @product = Product.new(params[:product])

    if @product.save
      flash[:success] = "Product saved!"
      redirect_to products_path
    else
      render 'new'
    end
  end

  private

  def signed_in_user
    unless signed_in?
      store_location
      redirect_to signin_path, notice: "Bitte melden Sie sich an."
    end
  end

end