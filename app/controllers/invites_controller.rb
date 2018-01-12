class InvitesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @invite = Invite.new
  end

  def create
    @invite = Invite.new(invite_params)
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def invite_params
    params.require(:invite).permit(:accepted).merge({user_id: current_user.id, trip_id: params[:trip_id]})
  end 
end
