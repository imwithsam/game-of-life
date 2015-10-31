class Cell
  def initialize
    @alive = true
  end

  def alive?
    @alive
  end

  def die
    @alive = false
  end
end
