class ScheduleController < ApplicationController
  def index
    @challenges = Challenge.all
  end
end
