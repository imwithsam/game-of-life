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
      cell = Cell.new(1, 2)

      expect(cell.x).to eq(1)
      expect(cell.y).to eq(2)
    end

    it("defaults to x-y coordinates of (0, 0)") do
      cell = Cell.new

      expect(cell.x).to eq(0)
      expect(cell.y).to eq(0)
    end

    xit("knows how many of its neighbors are alive or dead") do
      cell = Cell.new(1, 1)
      Cell.new(0, 0)
      Cell.new(1, 0).die
      Cell.new(2, 0)
      Cell.new(0, 1)
      Cell.new(2, 1)
      Cell.new(0, 2).die
      Cell.new(1, 2)
      Cell.new(2, 2).die

      expect(cell.neighbors.alive).to eq(5)
      expect(cell.neighbors.dead).to eq(3)
    end
  end

  describe(Grid) do
    it("can add and get a cell with x-y coordinates") do
      grid = Grid.new
      cell = Cell.new(2, 1)
      grid.add(cell)

      expect(grid.getCell(2, 1).x).to eq(2)
      expect(grid.getCell(2, 1).y).to eq(1)
    end
  end
end
