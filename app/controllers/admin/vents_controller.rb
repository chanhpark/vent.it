class Admin::VentsController < ApplicationController
  def index
    @vents = Vent.all
  end

  def edit
    @vent = Vent.find(params[:id])
  end

  def destroy
    @vent = Vent.find(params[:id])
    if @vent.destroy
      flash[:notice] = "Vent successfully deleted"
      redirect_to admin_vents_path
    end
  end
end
