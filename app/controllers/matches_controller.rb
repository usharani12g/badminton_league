class MatchesController < ApplicationController
  def index
    @matches = Match.order(played_at: :desc)
  end

  def show
    @match = Match.find(params[:id])
  end

  def new
    @match = Match.new
    @players = Player.order(:name)
  end

  def create
    @match = Match.new(match_params)

    # set the loser from the chosen winner
    if @match.winner_id == @match.player_a_id
      @match.loser_id = @match.player_b_id
    else
      @match.loser_id = @match.player_a_id
    end

    ActiveRecord::Base.transaction do
      if @match.save
        redirect_to matches_path, notice: 'Match recorded'
      else
        @players = Player.order(:name)
        render :new, status: :unprocessable_entity
      end
    end
  end


  def destroy
    @match = Match.find(params[:id])
    @match.destroy
    redirect_to matches_path, notice: 'Match removed'
  end

  private

  def match_params
    params.require(:match).permit(:player_a_id, :player_b_id, :winner_id, :score, :played_at)
  end
end
