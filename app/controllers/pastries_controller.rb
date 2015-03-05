class PastriesController < ApplicationController
  before_action :require_user, except: [:index, :show]
  def index
    @pastries = Pastry.all
  end

  def show
    @pastry = Pastry.find(params[:id])
  end

  def new
    @pastry = Pastry.new
  end

  def create
    @pastry = Pastry.new(pastry_params)
    @pastry.save
    if @pastry.save
      flash[:success] = "New pastry added"
      redirect_to root_path
    else
      flash[:error] = "some will go hungry, try again"
      render :new
    end
  end

  def edit
    @pastry = Pastry.find(params[:id])  
  end

  def update
    @pastry = Pastry.find(params[:id])
    if @pastry.update(pastry_params)
      flash[:success] = "Pastry updated"
      redirect_to pastry_path(@pastry)
    else
      flash[:error] = "Update fail"
      render :edit
    end
  end

  def destroy
    pastry = Pastry.find(params[:id])  
    pastry.destroy
    flash[:success] = "#{pastry.name} destroyed"
    redirect_to root_path
  end

  private
  def pastry_params
    params.require(:pastry).permit(:name, :price_in_pence, :description)
  end
end
