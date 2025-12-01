class LeaderboardsController < ApplicationController
  def index
    @players = Player.order(wins: :desc, losses: :asc, name: :asc)
  end
end
