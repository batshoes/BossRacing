class ScheduleController < ApplicationController
  def index
    @races = Race.all
  end
end
