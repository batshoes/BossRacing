class ResultsController < ApplicationController
  def show
    @result = Result.find(params[:id])
  end

  def new
    @challenge = Challenge.find(params[:challenge_id])
    @result = Result.new(challenge_id: @challenge.id)
  end

  # POST /results
  # POST /results.json
  def create
    @result = Result.new(result_params)
    respond_to do |format|
      if @result.save
        @result.challenge.update_attributes(status: 'completed')
        format.html { redirect_to challenge_result_path(@result.challenge_id, @result.id), notice: 'Result was successfully recorded.' }
        format.json { render :show, status: :created, location: @result }
      else
        format.html { render :new }
        format.json { render json: @result.errors, status: :unprocessable_entity }
      end
    end
  end

  private

  def result_params
    params.require(:result)
          .permit(:challenge_id, :victor_id, :defeated_id)
  end

end
