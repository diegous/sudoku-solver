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

game = Sudoku.new(sample_board)
puts "\nOriginal game"
puts game

Solver.new(game).solve
puts "\nSolution:"
puts game
