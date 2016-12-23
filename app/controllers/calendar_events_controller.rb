class CalendarEventsController < ApplicationController

  before_action :set_calendar_event, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @calendar_events = CalendarEvent.all
  end

  def show
  end

  def new
    @calendar_event = CalendarEvent.new params[:calendar_event] ? calendar_event_params : {}
  end

  def edit
    @calendar_event = current_user.calendar_events.where(id: params[:id]).first
  end

  def join_event
    calendar_event = CalendarEvent.find(params[:id])
    calendar_event.users << current_user if !current_user.belongs_to_calendar_event(calendar_event)
    redirect_to calendar_event_path(calendar_event)
  end

  def create
    @calendar_event = current_user.calendar_events.build(calendar_event_params)
    current_user.calendar_events << @calendar_event


      if @calendar_event.save


        # completed_email(current_user, "You completed #{@calendar_event.name} on #{@calendar_event.start_time.strftime("%d of %B")} at #{@calendar_event.start_time.strftime("%H%M")}")
        flash[:notice] = "You successfully created a calendar event"
        redirect_to user_calendar_event_path(current_user, @calendar_event)
      else
        format.html { render :new }
        format.json { render json: @calendar_event.errors, status: :unprocessable_entity }
      end

  end

  def update
    respond_to do |format|
      if @calendar_event.update(calendar_event_params)
        format.html { redirect_to @calendar_event, notice: 'Calendar event was successfully updated.' }
        format.json { render :show, status: :ok, location: @calendar_event }
      else
        format.html { render :edit }
        format.json { render json: @calendar_event.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @calendar_event.destroy
    respond_to do |format|
      format.html { redirect_to calendar_events_url, notice: 'Calendar event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

    def set_calendar_event
      @calendar_event = CalendarEvent.find(params[:id])
    end

    def calendar_event_params
      params.require(:calendar_event).permit(:details, :start_time, :calendar_completed)
    end

    # def completed_email(current_user, body)
    #   if @calendar_event.calendar_completed == "Yes"
    #     Email.send_email(current_user, body)
    #   end
    # end
end
