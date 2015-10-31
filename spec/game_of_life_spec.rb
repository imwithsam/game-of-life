require './lib/cell'
require './lib/grid'
require './lib/game'

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
      cell = Cell.new(nil, 1, 2)

      expect(cell.x).to eq(1)
      expect(cell.y).to eq(2)
    end

    it("defaults to x-y coordinates of (0, 0)") do
      cell = Cell.new

      expect(cell.x).to eq(0)
      expect(cell.y).to eq(0)
    end

    it("knows how many of its neighbors are alive or dead") do
      grid = Grid.new
      cell = Cell.new(grid, 1, 1)
      Cell.new(grid, 0, 0)
      Cell.new(grid, 1, 0).die
      Cell.new(grid, 2, 0)
      Cell.new(grid, 0, 1)
      Cell.new(grid, 2, 1)
      Cell.new(grid, 0, 2).die
      Cell.new(grid, 1, 2)
      Cell.new(grid, 2, 2).die

      expect(cell.livingNeighbors.count).to eq(5)
      expect(cell.deadNeighbors.count).to eq(3)
    end
  end

  describe(Grid) do
    it("can add and get a cell with x-y coordinates") do
      grid = Grid.new
      cell = Cell.new(nil, 2, 1)
      grid.add(cell)

      expect(grid.getCell(2, 1).x).to eq(2)
      expect(grid.getCell(2, 1).y).to eq(1)
    end
  end

  describe(Game) do
    it("can add a grid with a cell") do
      grid = Grid.new
      game = Game.new(grid)
      Cell.new(grid, 2, 1)

      expect(game.grid.getCell(2, 1).x).to eq(2)
      expect(game.grid.getCell(2, 1).y).to eq(1)
    end

    it("can be interated over game rounds") do
      grid = Grid.new
      game = Game.new(grid)

      expect(game.round).to eq(0)

      game.nextRound

      expect(game.round).to eq(1)

      game.nextRound

      expect(game.round).to eq(2)
    end

    it("kills off a cell with 0 living neighbors") do
      grid = Grid.new
      game = Game.new(grid)
      cell = Cell.new(grid, 1, 1)

      game.nextRound

      expect(cell.alive?).to be(false)
    end
  end
end
