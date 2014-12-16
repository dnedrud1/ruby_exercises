# A game of tic-tac-toe
# by Daniel Nedrud
# 10/29/2014

class Game
	
	attr_accessor :board
	
	# Each number represents one of the nine squares on a tic-tac-toe board
	def initialize
		@board = [1,2,3,4,5,6,7,8,9]
		@counter = 1
	end
		
  def start
  	# Loop will continue until victory condition is achieved or all of board is full
  	until victory("X") || victory("O")
  		@counter % 2 == 0 ? player = "X" : player = "O"
  		
			puts "Player \"#{player}\" pick your move:"
			puts @board[0..2].join(" ") + "\n" + @board[3..5].join(" ") + "\n" + @board[6..8].join(" ")
			
      get_move(player)
			
			# Gives a way out of loop if board is full
			return puts "It's a tie!" if @board.all? {|i| i == "X" || i == "O"} && (!victory("X") && !victory("O"))
		end
		
		# Choses what to display when loop ends
		if @counter % 2 == 0
			puts "Player O wins!"
		else
		  puts "Player X wins!"
	  end
		puts @board[0..2].join(" ") + "\n" + @board[3..5].join(" ") + "\n" + @board[6..8].join(" ")
	end
	
	def get_move(player)
    move = gets.chomp.to_i
		
		if @board.include?(move)
			@board[move-1] = player
			@counter += 1
		else
			puts "Please enter a valid number!"
		end
	end
  
  # Victory conidtion (player agnostic)
  def victory(player)
    condition1 = @board[0..2].all? { |i| i == player}
    condition2 = @board[3..5].all? { |i| i == player}
    condition3 = @board[6..8].all? { |i| i == player}
    condition4 = @board[0] == player && @board[3] == player && @board[6] == player
    condition5 = @board[1] == player && @board[4] == player && @board[7] == player
    condition6 = @board[2] == player && @board[5] == player && @board[8] == player
    condition7 = @board[0] == player && @board[4] == player && @board[8] == player
    condition8 = @board[2] == player && @board[4] == player && @board[6] == player
    
  	if condition1 || condition2 || condition3 || condition4 || condition5 || condition6 || condition7 || condition8
  	  true
	  else
  	  false
  	end
	end
	
end


# game = Game.new
# game.start
