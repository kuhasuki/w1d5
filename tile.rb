class Tile
  OFFSETS = [0, 1, -1]
  attr_accessor :danger_level

  $GLOBAL_I = 0

  def initialize(bomb_map, mine, own_coordinates)
    @own_coordinates = own_coordinates
    @tile_bomb_map = bomb_map.dup
    @is_mine = mine
    @hidden = true
    @danger_level = get_danger_level
  end

  # def inspect
  #   @danger_level.inspect
  # end

  def mine?
    @is_mine
  end

  def get_danger_level
    # p @tile_bomb_map
    if mine?
      9
    else
      neighbors = find_neighbors
      evaluate_neighbors(neighbors)
    end
  end

  def valid?(neighbor)
    !neighbor.include?(-1) && !neighbor.include?(9)
  end

  def find_neighbors
    x = @own_coordinates[0]
    y = @own_coordinates[1]
    all_valid_neighbors = []
    OFFSETS.each do |offset|
      OFFSETS.each do |offset_2|
        this_neighbor = [x + offset, y + offset_2]
        all_valid_neighbors << this_neighbor if valid?(this_neighbor)
      end
    end
    # all_valid_neighbors.delete([@own_coordinates])
    all_valid_neighbors
  end

  def evaluate_neighbors(neighbors)
    level = 0
    neighbors.each do |pos|
      p [@own_coordinates, pos]
      if @tile_bomb_map[pos[0]][pos[1]] == true
        level += 1
        p "incremented"
      end
    end
    level
  end

end















#
