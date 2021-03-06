class Board
  attr_reader :grid

  def initialize
    reset
  end

  def accept_move(index, player)
    return if grid[index] != -1
    @grid[index] = player
  end

  def game_over?
    for i in 0..2
      if grid[3*i] != -1 && grid[3*i] == grid[3*i + 1] && grid[3*i + 1] == grid[3*i + 2]
        return grid[3*i]
      elsif grid[i] != -1 && grid[i] == grid[i + 3] && grid[i + 3] == grid[i + 6]
        return grid[i]
      end
    end

    if grid[0] != -1 && grid[0] == grid[4] && grid[4] == grid[8]
      return grid[0]
    elsif grid[2] != -1 && grid[2] == grid[4] && grid[4] == grid[6]
      return grid[2]
    end

    grid.include?(-1) ? false : -1

  end

  def reset
    @grid = Array.new(9, -1)
  end
end
