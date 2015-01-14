class VentsController < ApplicationController

  def index
    @vents = Vent.all.order("created_at DESC").limit(10).page params[:page]
    @random_vent = Vent.where(id: @vents).order("RANDOM()").first
    @categories = Category.all
  end

  def show
    @vent = Vent.find(params[:id])
    @comments = @vent.comments.order("created_at DESC")
    @categories = Category.all
  end

  def new
    @vent = Vent.new
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
    if @vent.save
      flash[:notice] = "Vents been posted"
      redirect_to vent_path(@vent)
    else
      render "new"
    end
  end

private

  def vent_params
    params.require(:vent).permit(:title, :content, :category_id)
  end


end
