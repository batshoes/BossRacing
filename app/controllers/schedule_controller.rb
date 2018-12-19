class ScheduleController < ApplicationController
  def index
    @events = Event.all
  end
end
