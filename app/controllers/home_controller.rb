class HomeController < ApplicationController
  def index
    @users = User.first(10)
  end
end
