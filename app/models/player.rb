class Player < ApplicationRecord
  has_many :matches_as_a, class_name: 'Match', foreign_key: :player_a_id, dependent: :nullify
  has_many :matches_as_b, class_name: 'Match', foreign_key: :player_b_id, dependent: :nullify
  has_many :wins, class_name: 'Match', foreign_key: :winner_id, dependent: :nullify
  has_many :losses, class_name: 'Match', foreign_key: :loser_id, dependent: :nullify

  validates :name, presence: true

  def total_matches
    wins_count + losses_count
  end

  def wins_count
    self.wins.count || 0
  end

  def losses_count
    self.losses.count || 0
  end


end
