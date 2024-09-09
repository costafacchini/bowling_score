def build_player_with_totals(name, scores)
  player = Player.new(name)
  scores.each do |score|
    player.add_score_at_pinfall(score)
  end
  Calculator::Score.new.fill_total_scores([player])

  player
end

def build_player(name, scores)
  player = Player.new(name)
  scores.each do |score|
    player.add_score_at_pinfall(score)
  end

  player
end
