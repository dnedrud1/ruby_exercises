# Knight's Travails
# by Daniel Nedrud
# 12/06/14


# This chess board is just a two-dimensional array of coordinates i.e [4,7].
class Chess_board

  attr_accessor :squares

  def initialize
    @squares = []
    (1..8).each { |x| (1..8).each { |i| @squares.push([x,i]) } }
  end
  
end

# A Knight piece initialized with a position and methods to change position and get available moves.
class Knight

  attr_accessor :position

  def initialize(position)
    @position = position
  end
  
  def available_moves
    board = Chess_board.new.squares
    
    all_unchecked = [[@position[0] + 2, @position[1] + 1], [@position[0] + 2, @position[1] - 1], [@position[0] - 2, @position[1] + 1], [@position[0] - 2, @position[1] - 1], [@position[0] + 1, @position[1] + 2], [@position[0] - 1, @position[1] + 2], [@position[0] + 1, @position[1] - 2], [@position[0] - 1, @position[1] - 2]]
    all = all_unchecked.select { |i| board.include?(i) }
  end  
  
  def move(new)
    @position = new if available_moves.include?(new)
  end

end

# A recursive method to find the shortest path a knight can take from any square on a chess board to any other.
# Uses a "breadth-first-search" strategy complete with queue.
# The only annoying thing is that the initial array you pass in as a starting position must be inside another array.
def knight_shortest_path(current,goal,queue = [])
  start = current[-1]
  if start == goal
    return current
  else
    moves = Knight.new(start).available_moves
    moves.each do |i|
      # I use "holder" in place of "current" to keep "current" from being modified by the push method.
      holder = current.map { |i| i }
      holder.push(i)
      queue.push(holder)
    end
    new = queue.shift
    knight_shortest_path(new,goal,queue)
  end
end
 
p knight_shortest_path([[8,1]],[8,8])






