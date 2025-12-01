class Match < ApplicationRecord
  belongs_to :player_a, class_name: 'Player'
  belongs_to :player_b, class_name: 'Player'
  belongs_to :winner, class_name: 'Player'
  belongs_to :loser, class_name: 'Player'

  validates :player_a, :player_b, :winner, :loser, presence: true
  validate :players_must_be_different
  validate :winner_must_be_participant
  validate :loser_must_be_participant
  validate :winner_and_loser_must_differ

  after_create :increment_counters

  def players_must_be_different
    if player_a_id == player_b_id
      errors.add(:player_b, 'must be different from player_a')
    end
  end

  def winner_must_be_participant
    unless [player_a_id, player_b_id].include?(winner_id)
      errors.add(:winner, 'must be either player_a or player_b')
    end
  end

  def loser_must_be_participant
    unless [player_a_id, player_b_id].include?(loser_id)
      errors.add(:loser, 'must be either player_a or player_b')
    end
  end

  def winner_and_loser_must_differ
    if winner_id == loser_id
      errors.add(:loser, 'must be different from winner')
    end
  end

  private

  def increment_counters
    Player.increment_counter(:wins, winner_id)
    Player.increment_counter(:losses, loser_id)
  end
end
