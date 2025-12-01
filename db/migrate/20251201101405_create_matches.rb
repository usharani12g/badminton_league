class CreateMatches < ActiveRecord::Migration[7.0]
  def change
    create_table :matches do |t|
      t.references :player_a, null: false, foreign_key: { to_table: :players }
      t.references :player_b, null: false, foreign_key: { to_table: :players }
      t.references :winner, null: false, foreign_key: { to_table: :players }
      t.references :loser, null: false, foreign_key: { to_table: :players }
      t.string :score
      t.datetime :played_at
      t.timestamps
    end

  end
end
