class UsersController < ApplicationController
  def show
    @user = User.find(params[:id])
    @calendar_events = @user.calendar_events
  end


end
