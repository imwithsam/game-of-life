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
end
