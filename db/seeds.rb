players = %w[Usha Anand Aarya Veena].map do |name|
  Player.create!(name: name)
end

Match.create!(player_a: players[0], player_b: players[1], winner: players[0], loser: players[1], score: '21-18, 21-17', played_at: Time.now - 5.days)
Match.create!(player_a: players[2], player_b: players[3], winner: players[3], loser: players[2], score: '21-19, 21-15', played_at: Time.now - 4.days)
Match.create!(player_a: players[0], player_b: players[3], winner: players[0], loser: players[3], score: '18-21, 21-19, 21-17', played_at: Time.now - 2.days)
