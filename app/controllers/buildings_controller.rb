class BuildingsController < ApplicationController

  def create
    @building = Building.new(params.require(:building).permit(:address, :city, :state, :zip_code, :description))
    if @building.save
      redirect_to @building, notice: 'Building successfully listed.'
    else
      render action: 'new'
    end
  end

  def index
    @buildings = Building.all
  end

  def new
    @building = Building.new
    @states = %w[AL AK AZ AR CA CO CT DE FL GA HI ID IL IN IA KS KY LA ME MD MA MI MN MS MO MT NE NV NH NJ NM NY NC ND OH OK OR PA RI SC SD TN TX UT VT VA WA WV WI WY]
  end

  def show
    @building = Building.find(params[:id])
  end

end
