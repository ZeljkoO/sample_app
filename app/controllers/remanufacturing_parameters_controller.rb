class RemanufacturingParametersController < ApplicationController

  before_filter :signed_in_user

  def new
    @remanufacturing_parameter = RemanufacturingParameter.new
  end

  def index
    @remanufacturing_parameters = RemanufacturingParameter.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @production_parameters }
    end
  end

  def update
    @remanufacturing_parameter = RemanufacturingParameter.find(params[:id])

    if @remanufacturing_parameter.update_attributes(params[:remanufacturing_parameter])
      flash[:success] = "Update successful!"
      redirect_to(remanufacturing_parameters_path)
    else
      render 'edit'
    end
  end

  def destroy
    @remanufacturing_parameter = RemanufacturingParameter.find(params[:id])
    @remanufacturing_parameter.destroy
    flash[:success] = "Parameters for Recoverable Product destroyed."
    redirect_to remanufacturing_parameters_path
  end

  def edit
    @remanufacturing_parameter = RemanufacturingParameter.find(params[:id])
  end

  def show
    @remanufacturing_parameter = RemanufacturingParameter.find(params[:id])
  end

  def create
    @remanufacturing_parameter = RemanufacturingParameter.new(params[:remanufacturing_parameter])

    if @remanufacturing_parameter.save
      flash[:success] = "Parameters for Recoverable Product saved!"
      redirect_to remanufacturing_parameters_path
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