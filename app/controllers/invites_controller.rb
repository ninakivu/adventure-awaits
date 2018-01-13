class InvitesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @trip = Trip.find(params[:trip_id])
    @invite = @trip.invites.new
    @users = User.all
  end

  def create
    @invite = Invite.new()
    @invite.accepted = false
    @invite.user_id = current_user.id
    @invite.trip_id = params[:trip_id]
    @invite.recipient_id = params[:invite][:recipient_id]
    if @invite.save
      redirect_to trip_path(params[:trip_id])
    end
  end

  def accept
    @invite = Invite.find(params[:id])
    @invite.accepted = true
    if @invite.save
      redirect_to trip_path(@invite.trip_id)
    end
  end

  def reject
    @invite = Invite.find(params[:id])
    @invite.accepted = false
    if @invite.save
      redirect_to trip_path(@invite.trip_id)
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  # def invite_params
  #   params.require(:invite).permit(:recipient_id)
  # end 
end
