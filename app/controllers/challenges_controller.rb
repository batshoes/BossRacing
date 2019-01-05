class ChallengesController < ApplicationController
  before_action :require_login

  def index
    @challenges = Challenge.all
  end

  def show
    @challenge = Challenge.find(params[:id])
  end

  def new
    @challenge = Challenge.new
    @events = Event.all
    @challengers = User.where.not(id: current_user.id)
  end

  def create
    @challenge = Challenge.new(challenge_params)
    binding.pry
    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge Initiated!' }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @challenge = Challenge.find(params[:id])
    @events = Event.all
    @challengers = User.where.not(id: current_user.id)
  end

  def update
    @challenge = Challenge.find(params[:id])
    @challenge.update_attributes(challenge_params)

    respond_to do |format|
      if @challenge.save
        format.html { redirect_to @challenge, notice: 'Challenge Initiated!' }
        format.json { render :show, status: :created, location: @challenge }
      else
        format.html { render :new }
        format.json { render json: @challenge.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def challenge_params
    params.require(:challenge)
          .permit(:challenger_id, :challengee_id, :event_id, :start_time)
  end
end
