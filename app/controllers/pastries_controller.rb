class PastriesController < ApplicationController
  def index
    @pastries = [
      {
        name: "Croissant",
        price_in_pence: 350,
        description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
      },
      {
        name: "Pan au chocolat",
        price_in_pence: 370,
        description: "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat."
        }]
  end

  def show
  end

  def new
  end

  def edit
  end
end
