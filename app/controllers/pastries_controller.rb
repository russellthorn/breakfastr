class PastriesController < ApplicationController
  before_action :require_user, except: [:index, :show]
  before_action :find_pastry, only: [:show, :edit, :update]
  before_action :require_owner, only: [:edit, :update, :destroy]
  def index
    @pastries = Pastry.all
  end

  def show
    # @pastry = Pastry.find(params[:id])
  end

  def new
    if params[:user_id].present?
      @user = User.find(params[:user_id])
      @pastries = @user.pastries
    else
      @pastries = Pastry.all
    end
    @pastry = Pastry.new
  end

  def create
    @pastry = current_user.pastries.new(pastry_params)
    @pastry.save
    if @pastry.save
      flash[:success] = "New pastry added"
      redirect_to root_path
    else
      flash[:error] = "someone will go hungry, try again"
      render :new
    end
  end

  def edit
    # @pastry = Pastry.find(params[:id])
    require_owner
  end

  def update
    # @pastry = Pastry.find(params[:id])
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
    params.require(:pastry).permit(:name, :price_in_pence, :description, :image)
  end

  def find_pastry
    @pastry = Pastry.find(params[:id])
  end
end
