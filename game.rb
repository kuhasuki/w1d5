require_relative 'board'
require_relative 'tile'

class MineSweeper
  attr_accessor :bomb_map, :board

  def initialize(player)
    @player = player
    @bomb_map = populate(7)
    @board = Board.new(@bomb_map)
  end

  def populate(bomb_count)
    @bomb_map = Array.new(9) { Array.new(9) }
    until bomb_count == 0
      random_locations = [rand(9), rand(9)]
      unless @bomb_map[random_locations[0]][random_locations[1]]
        @bomb_map[random_locations[0]][random_locations[1]] = true
        bomb_count -= 1
      end
    end
    @bomb_map
    # p @bomb_map
  end

  def play
    if !won?
      @board.display
      @board.accept_move(get_input)
    elsif @board.detonated?
      puts "A bomb went off!"
    else
      puts "You win!"
    end
  end

  def won?

  end

end


d = MineSweeper.new("ben")
# p c.bomb_map
d.board.build_board
