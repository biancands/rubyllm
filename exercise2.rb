# classes de exceção
class WrongNumberOfPlayersError < StandardError; end # numero de jogadores não é 2
class NoSuchStrategyError < StandardError; end # estrategia invalida

def rps_game_winner(game)
  raise WrongNumberOfPlayersError unless game.length == 2

  valid_strategies = ["R", "P", "S"]
  player1, player2 = game

  strategy1 = player1[1].upcase
  strategy2 = player2[1].upcase

  unless valid_strategies.include?(strategy1) && valid_strategies.include?(strategy2)
    raise NoSuchStrategyError
  end

  if strategy1 == strategy2
    return player1
  end

  if (strategy1 == "R" && strategy2 == "S") ||
     (strategy1 == "S" && strategy2 == "P") ||
     (strategy1 == "P" && strategy2 == "R")
    return player1
  else
    return player2
  end
end

def rps_tournament_winner(tournament)
  if tournament[0][0].is_a?(String)
    return rps_game_winner(tournament)
  else
    left_winner = rps_tournament_winner(tournament[0])
    right_winner = rps_tournament_winner(tournament[1])
    return rps_game_winner([left_winner, right_winner])
  end
end

# Example
tournament = [
  [
    [ ["Kristen", "P"], ["Dave", "S"] ],
    [ ["Richard", "R"], ["Michael", "S"] ],
  ],
  [
    [ ["Allen", "S"], ["Omer", "P"] ],
    [ ["David E.", "R"], ["Richard X.", "P"] ]
  ]
]

puts rps_tournament_winner(tournament) # => ["Richard", "R"]
