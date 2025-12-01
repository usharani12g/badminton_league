class PlayersController < ApplicationController
  def index
    @players = Player.order(wins: :desc, losses: :asc, name: :asc)
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def create
    @player = Player.new(player_params)
    if @player.save
      redirect_to players_path, notice: 'Player created'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    @player = Player.find(params[:id])
    if @player.update(player_params)
      redirect_to player_path(@player), notice: 'Player updated'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def edit
    @player = Player.find(params[:id])
  end

  def destroy
    puts "debug: ==> destroy"
    @player = Player.find(params[:id])

    if player_has_matches?(@player)
      puts "before delete validation...."
      redirect_to players_path, alert: "Cannot delete player because there are matches referencing this player. Delete or reassign those matches first."
    else
      @player.destroy
      redirect_to players_path, notice: "Player deleted"
    end
  end

  private

  def player_has_matches?(player)
    Match.where(
      "player_a_id = :id OR player_b_id = :id OR winner_id = :id OR loser_id = :id",
      id: player.id
    ).exists?
  end

  def player_params
    params.require(:player).permit(:name)
  end
end
