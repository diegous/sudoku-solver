class Sudoku
  attr_reader :matrix
  BLANK = '.'

  def initialize(matrix)
    @matrix = matrix
  end

  def row(x)
    matrix[x]
  end

  def column(y)
    matrix.map { |row| row[y] }
  end

  def at((x,y))
    matrix[y][x]
  end

  def empty?(cell)
    at(cell) == BLANK
  end

  def write(n, (x, y))
    matrix[y][x] = n
  end

  def erase(cell)
    write(BLANK, cell)
  end

  def subgrid_neighbors(x,y)
    base_x = x - (x % 3)
    base_y = y - (y % 3)
    matrix[base_y,3].flat_map { |row| row[base_x, 3] }
  end

  def unknowns
    indexes = (0..8).to_a
    indexes.product(indexes)
           .select { |cell| empty? cell }
  end

  def to_s
    matrix.each_slice(3).map do |rows|
      rows.map do |row|
        row.each_slice(3)
           .map { |group| group.join(' ') }
           .join('|')
      end
        .join("\n")
    end
      .join("\n-----+-----+-----\n")
  end
end
