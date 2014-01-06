class OwnersController < ApplicationController

  def create
    @owner = Owner.new(params.require(:owner).permit(:first_name, :last_name, :email, :company_name))
    if @owner.save
      redirect_to @owner, notice: 'Owner successfully created.'
    else
      render action: 'new'
    end
  end

  def destroy
    Owner.find(params[:id]).destroy
    redirect_to owners_path
  end

  def index
    @owners = Owner.all
  end

  def new
    @owner = Owner.new
  end

  def show
    @owner= Owner.find(params[:id])
  end

end
