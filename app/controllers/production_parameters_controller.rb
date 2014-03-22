class ProductionParametersController < ApplicationController

  before_filter :signed_in_user

  def new
    @production_parameter = ProductionParameter.new
  end

  def index
    @production_parameters = ProductionParameter.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @production_parameters }
    end
  end

  def update
    @production_parameter = ProductionParameter.find(params[:id])

    if @production_parameter.update_attributes(params[:production_parameter])
      flash[:success] = "Update successful!"
      redirect_to(production_parameters_path)
    else
      render 'edit'
    end
  end

  def destroy
    @production_parameter = ProductionParameter.find(params[:id])
    @production_parameter.destroy
    flash[:success] = "Parameters for Serviceable Product destroyed."
    redirect_to production_parameters_path
  end

  def edit
    @production_parameter = ProductionParameter.find(params[:id])
  end

  def show
    @production_parameter = ProductionParameter.find(params[:id])
  end

  def create
    @production_parameter = ProductionParameter.new(params[:production_parameter])

    if @production_parameter.save
      flash[:success] = "Parameters for Serviceable Product saved!"
      redirect_to production_parameters_path
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