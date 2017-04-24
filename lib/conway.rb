class Game
  attr_accessor :size
  attr_accessor :current_board
  attr_accessor :temp_board

  def initialize(size)
    @size = size
    @blank_board = Array.new(@size) { Array.new(@size, 0) }
    @current_board = Array.new(@size) { Array.new(@size, 0) }
    @temp_board = Array.new(@size) { Array.new(@size, 0) }
  end

  def intial_seed
    current_board[2][0] = 1
    current_board[3][1] = 1
    current_board[3][2] = 1
  end

  def get_neighbors(i, j)
    neighbors = []
    neighbors.push(current_board[i + 1][j])
    neighbors.push(current_board[i - 1][j])
    neighbors.push(current_board[i][j + 1])
    neighbors.push(current_board[i][j - 1])
    neighbors.push(current_board[i + 1][j + 1])
    neighbors.push(current_board[i - 1][j - 1])

    p neighbors
  end

  def sum_neighbors(array)
    sum = array.reduce(:+)
    p sum
  end

  def play(i, j)
    sum = sum_neighbors(get_neighbors(i, j))
    if current_board[i][j] == 0 # if dead
      if sum == 3 # if dead, come alivE!
        @temp_board[i][j] = 1
      else sum != 3 # stay dead
        @temp_board[i][j] = 0
      end
   # implied game_board[i][j] == 1 # if alivE
    else # if alive
      if sum < 2 #dies
      @temp_board[i][j] = 0
      elsif sum >= 3
      # if alive and more than 3 live neighbors, cell will die
      @temp_board[i][j] = 0
      elsif sum == 2 || sum == 3
      # any live cell with 2 OR 3 live neighbors lives on
      @temp_board[i][j] = 1
      end
    end
  end
end

new_game = Game.new(4)
# p new_game
# p new_game.current_board
# p new_game
p new_game.intial_seed
p new_game.current_board
# fun = new_game.get_neighbors(1, 1)
# p new_game.sum_neighbors(fun)
# p "Play method returns #{new_game.play(1, 1)}"
# p "Play method returns #{new_game.play(0, 1)}"
# p "Play method returns #{new_game.play(0, 0)}"
# p "Play method returns #{new_game.play(3, 3)}"
#I'm surpised that seems to work on  all those values

#shouldn't we be pushing values that don't exsist? I'm gonna see what happens when you do that inpry.
