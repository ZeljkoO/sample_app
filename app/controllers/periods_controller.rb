class PeriodsController < ApplicationController

  before_filter :signed_in_user

  def new
    @period = Period.new
  end

  def index
    @periods = Period.all
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @periods }
    end
  end

  def show
    @period = Period.find(params[:id])
  end

  def edit
    @period = Period.find(params[:id])
  end

  def update
    @period = Period.find(params[:id])

    if @period.update_attributes(params[:period])
      flash[:success] = "Update successful!"
      redirect_to periods_path
    else
      render 'edit'
    end
  end

  def destroy
    @period = Period.find(params[:id])
    @period.destroy
    flash[:success] = "Period destroyed."
    redirect_to periods_path
  end

  def create
    @period = Period.new(params[:period])

    if @period.save
      flash[:success] = "Period saved!"
      redirect_to periods_path
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