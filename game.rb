class MineSweeper
  attr_accessor :bomb_map

  def initialize(player)
    @player = player
    @bomb_map = populate(5)
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
  end

end


c = MineSweeper.new("ben")
p c.bomb_map
