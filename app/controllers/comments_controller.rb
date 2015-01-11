class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @vent = Vent.find(params[:vent_id])
    @reply = Comment.find_or_initialize_by(vent: @vent, user: current_user)
    if @reply.new_record?
      @reply.attributes = comment_params
      if @reply.save
        redirect_to vent_path(id: @vent.id)
        flash[:notice] = "Comment has been posted"
      else
        redirect_to vent_path(id: @vent.id)
        flash[:notice] = "You cant leave a blank reply"
      end
    else
      redirect_to vent_path(id: @vent.id)
      flash[:notice] = "You already commented on this vent"
    end
  end

  def edit
    @vent = Vent.find(params[:vent_id])
    @reply = Comment.find(params[:id])
    @user = current_user
  end

  def update
    @reply = Comment.find(params[:id])

    if @reply.update(comment_params)
      redirect_to vent_path(id: @reply.vent_id)
      flash[:notice] = "Comment Updated Successfully"
    else
      render :edit
    end
  end

  def destroy
    @vent = Vent.find(params[:vent_id])
    @reply = Comment.find(params[:id])
    if @reply.destroy
      redirect_to vent_path(@vent), notice: "Reply Deleted Successfully"
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:reply)
  end
end
