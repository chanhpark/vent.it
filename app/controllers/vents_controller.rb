class VentsController < ApplicationController

  def index
    @vents = Vent.all.order("created_at DESC")
  end

  def show
    @vent = Vent.find(params[:id])
    @comments = @vent.comments.order("created_at DESC")
  end

  def new
    @vent = Vent.new
  end

  def create
    @vent = Vent.new(vent_params)
    if @vent.save
      flash[:notice] = "Vents been posted"
      redirect_to vent_path(@vent)
    else
      render "new"
    end
  end

private

  def vent_params
    params.require(:vent).permit(:title, :content)
  end


end
