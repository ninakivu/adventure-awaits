class CommentsController < ApplicationController
  def create
   @comment = Comment.new(comment_params)
   @comment.user = current_user
   @trip = Trip.find(params[:trip_id])
   @comment.trip = @trip
   if @comment.save
    redirect_to trip_path(@trip)
   else
    redirect_to new_trip_comments_path
   end 
  end

  def destroy
    @comment = Comment.find(params[:id])
    @trip = Trip.find(params[:trip_id])
    if @comment.destroy
      redirect_to trips_path
    else 
      redirect_to trip_path(@trip)
    end 
  end

  private
  def comment_params
    params.require(:comment).permit(:body, :user, :trip_id)
  end 
end
