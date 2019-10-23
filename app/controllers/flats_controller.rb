class FlatsController < ApplicationController

  before_action :set_item, only: [:show, :edit, :update, :destroy]

  def new
    @flat = Flat.new
  end

  def create
    @flat = Flat.create(flat_params)
    if @flat.save
      redirect_to flats_path
    else
      render :new
    end
  end

  def index
    if params[:query].present?
      @query = params[:query]
      @flats = Flat.where("name Like '%#{params[:query]}%'")
    else
      @flats = Flat.all
    end
  end

  def show
  end

  def update
    @flat.update(flat_params)
    redirect_to action: 'show'
  end

  def destroy
    @flat.destroy
    redirect_to action: "index"
  end


  private


  def set_item
    @flat = Flat.find(params[:id])
  end

  def flat_params
    params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
  end

end
