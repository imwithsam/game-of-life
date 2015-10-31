class Game
  attr_reader :grid, :round

  def initialize(grid)
    @grid = grid
    @round = 0
  end

  def nextRound
    @round = round + 1
  end
end
