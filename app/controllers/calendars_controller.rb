class CalendarsController < ApplicationController
  def index
  	@user = current_user if current_user 
    @calendar_events = @user.calendar_events if @user
  end
end
