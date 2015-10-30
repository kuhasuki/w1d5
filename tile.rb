class Tile

  def initialize(bomb_map, mine)
    @bomb_map = bomb_map
    @mine = mine
  end

  def inspect
    @mine.inspect
  end

end
