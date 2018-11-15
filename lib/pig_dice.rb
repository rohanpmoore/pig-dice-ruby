require 'pry'

module Die
  def roll
    number = Random.new()
    number.rand(6) + 1
  end
end

class Player
  attr_reader(:name, :points)
  def initialize(name)
    @name = name
    @points = 0
  end
  def add_points(turn_points)
    @points += turn_points
    @points >= 100
  end
end

class PigDiceGame
  include Die
  attr_reader(:turn_points, :players, :turn)
  def initialize
    @players = []
    @turn = 0
    @turn_points = 0
  end
  def hold
    is_winner = @players[@turn].add_points(@turn_points)
    if is_winner
      return "You win! Congratulations!"
    end
    end_turn()
    return ""
  end
  def continue
    roll = roll()
    if roll == 1
      end_turn()
    else
      @turn_points += roll
    end
    roll
  end
  def end_turn
    @turn_points = 0
    @turn += 1
    if @turn == @players.length
      @turn = 0
    end
  end
  def add_player(name)
    player = Player.new(name)
    @players.push(player)
  end
end
