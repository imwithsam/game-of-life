class Game
  attr_reader :grid, :round

  def initialize(grid)
    @grid = grid
    @round = 0
  end

  def nextRound
    checkCells

    @round = round + 1
  end

  private

  def checkCells
    @grid.cells.each do |cell|
      cell.die if cell.livingNeighbors.count < 2 ||
                  cell.livingNeighbors.count > 3
      cell.revive if cell.livingNeighbors.count == 3
    end
  end
end
