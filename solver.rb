require './sudoku'

class Solver
  def initialize(game)
    @game = game
  end

  def solve
    solve_next @game.unknowns
  end

  private

    def candidates(x, y)
      ('1'..'9').to_a -
        @game.row(y) -
        @game.column(x) -
        @game.subgrid_neighbors(x,y)
    end

    def solve_next(unknowns)
      return true if unknowns.empty?

      cell, *rest = *unknowns

      candidates(*cell).each do |n|
        @game.write(n, *cell)
        return true if solve_next(rest)
        @game.erase(*cell)
      end

      false
    end
end
