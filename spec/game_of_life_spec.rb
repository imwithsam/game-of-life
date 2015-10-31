require './lib/cell'

RSpec.describe("Game of Life") do
  describe(Cell) do
    it("is living when created") do
      cell = Cell.new

      expect(cell.alive?)
    end

    it("can die") do
      cell = Cell.new
      cell.die

      expect(cell.alive?).to be false
    end
  end
end
