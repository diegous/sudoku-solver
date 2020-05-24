require './solver'

sample_board = [
  '.9..62...',
  '3.65...9.',
  '.....82..',

  '..2...1.9',
  '5.3296...',
  '879....2.',

  '...1.....',
  '1.7...945',
  '..5..983.'
].map { |row| row.split('') }

sudoku = Sudoku.new(sample_board)
puts "\nOriginal board"
puts sudoku

Solver.new(sudoku).solve
puts "\nSolution:"
puts sudoku
