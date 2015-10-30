require_relative 'tile'

class Board

  def initialize(bomb_map)
    @bomb_map = bomb_map
    @game_board = bomb_map.dup
  #  build_board
  end

  def build_board
    @game_board.each do |row|
      row.map! do |square|
        square ? Tile.new(@bomb_map, true) : Tile.new(@bomb_map, false)
      end
    end
  end

  def to_s

  end

end
