class Game
  attr_reader :grid, :round

  def initialize(grid)
    @grid = grid
    @round = 0
  end

  def nextRound
    @grid.cells.each do |cell|
      cell.die if cell.livingNeighbors.count < 2 ||
                  cell.livingNeighbors.count > 3
    end

    @round = round + 1
  end
end
