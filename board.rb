require_relative 'tile'

class Board

  def initialize(bomb_map)
    @bomb_map = bomb_map
    @game_board = bomb_map.map(&:dup)
  #  build_board
  end

  def build_board
    @game_board.each_with_index do |row, y_idx|
      row.each_with_index do |is_mine, x_idx|
        coords = [y_idx, x_idx]
        if x_idx == 0 && y_idx == 0
          p @bomb_map
        end
        row[x_idx] = Tile.new(@bomb_map.dup, is_mine, coords)
      end
    end
    show_board
  end

  def show_board
    puts "Minesweeper"
    @game_board.each do |row|
      row.each do |col|
        print [col.danger_level]
      end
      puts "\n"
    end
        # col.is_a?(Fixnum) ? col :
  end

end
