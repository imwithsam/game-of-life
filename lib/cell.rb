require './lib/grid'

class Cell
  attr_reader :x, :y

  def initialize(grid = nil, x = 0, y = 0)
    @alive = true
    @grid = grid
    @x = x
    @y = y
    @grid.add(self) if @grid
  end

  def alive?
    @alive
  end

  def die
    @alive = false

    self
  end

  def neighbors
    neighbors = []
    cell_nw = @grid.getCell(x - 1, y - 1)
    cell_n  = @grid.getCell(x, y - 1)
    cell_ne = @grid.getCell(x + 1, y - 1)
    cell_w  = @grid.getCell(x - 1, y)
    cell_e  = @grid.getCell(x + 1, y)
    cell_sw = @grid.getCell(x - 1, y + 1)
    cell_s  = @grid.getCell(x, y + 1)
    cell_se = @grid.getCell(x + 1, y + 1)

    neighbors << cell_nw
    neighbors << cell_n
    neighbors << cell_ne
    neighbors << cell_w
    neighbors << cell_e
    neighbors << cell_sw
    neighbors << cell_s
    neighbors << cell_se

    neighbors
  end
end
