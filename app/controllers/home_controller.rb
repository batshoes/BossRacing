class HomeController < ApplicationController
  def index
    @users = User.first(10)
    @challenges = Challenge.upcoming(10, 'accepted')
  end
end
