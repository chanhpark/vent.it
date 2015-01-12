class Admin::VentsController < ApplicationController
  def index
    @vents = Vent.all
  end

  def edit
    @vent = Vent.find(params[:id])
  end

  def update
    @vent = Vent.find(params[:id])
    if @vent.update(vent_params)
      redirect_to admin_vents_path
      flash[:notice] = "Your Vent has been successfully updated."
    end
  end


  def create
    @vent = Vent.new(vent_params)
  end

  def destroy
    @vent = Vent.find(params[:id])
    if @vent.destroy
      flash[:notice] = "Vent successfully deleted"
      redirect_to admin_vents_path
    end
  end

  private

  def vent_params
    params.require(:vent).permit(:content)
  end
end
