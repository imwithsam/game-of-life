class Cell
  attr_reader :x, :y

  def initialize(x = 0, y = 0)
    @alive = true
    @x = x
    @y = y
  end

  def alive?
    @alive
  end

  def die
    @alive = false
  end

  def neighbors
    neighbors = []
    cell_nw = Cell.get(x - 1, y - 1)
    cell_n  = Cell.get(x, y - 1)
    cell_ne = Cell.get(x + 1, y - 1)
    cell_w  = Cell.get(x - 1, y)
    cell_e  = Cell.get(x + 1, y)
    cell_sw = Cell.get(x - 1, y + 1)
    cell_s  = Cell.get(x, y + 1)
    cell_se = Cell.get(x + 1, y + 1)

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
