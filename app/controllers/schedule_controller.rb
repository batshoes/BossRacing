class ScheduleController < ApplicationController
  before_action :require_login
  def index
    @challenges = Challenge.all
  end
end
