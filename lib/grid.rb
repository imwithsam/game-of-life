require './lib/cell'

class Grid
  attr_reader :cells

  def initialize
    @cells = []
  end

  def add(cell)
    @cells << cell
  end

  def getCell(x, y)
    @cells.detect { |cell| cell.x == x && cell.y == y }
  end
end
