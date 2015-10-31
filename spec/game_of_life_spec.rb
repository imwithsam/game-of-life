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

      expect(cell.alive?).to be(false)
    end

    it("knows its x-y coordinates in the universe") do
      cell = Cell.new(1 , 2)

      expect(cell.x).to be(1)
      expect(cell.y).to be(2)
    end

    it("defaults to x-y coordinates of (0, 0)") do
      cell = Cell.new

      expect(cell.x).to be(0)
      expect(cell.y).to be(0)
    end
  end
end
