# Connect Four
# by Daniel Nedrud
# 12/15/2014

class ConnectFour

  attr_accessor(:board, :moves_count)

  def initialize
    # connect four board is a two dimensional array with 6 rows of 7 spaces each
    @board = []
    6.times { @board.push((0..6).to_a) }
    @moves_count = 0
  end 
  
  def start
    puts "Welcome to a game of Connect Four!"
  	# Loop will continue until victory condition is achieved or all of board is full
  	until victory?("ϴ") || victory?("Ϯ")
  		@moves_count % 2 == 0 ? player = "ϴ" : player = "Ϯ"
  		
			puts "Player \"#{player}\" pick your move:"
			puts display
			
      player_move(player)
			
			# Gives a way out of loop if board is full
			return puts "There are no winners this game!" if tie?
		end
		
		# Choses what to display when loop ends
		if @moves_count % 2 == 0
			puts "Player Ϯ wins!"
		else
		  puts "Player ϴ wins!"
	  end
		puts display
	end
  
  def place_piece(piece,position)
    @board.each_with_index do |row,index|
      if !["ϴ","Ϯ"].include?(@board[index][position-1])
        @board[index][position-1] = piece
        break
      end
    end
  end
  
  def display
    display_board = @board.map { |row| row.map { |space| ["ϴ","Ϯ"].include?(space) ? space : "_" } }.reverse
    "1 2 3 4 5 6 7\n" + display_board.map { |row| row.join(" ") }.join("\n")
  end
  
  def victory?(piece)
    victory_conditions = []
    # adds victory conditions for all diagonals and columns
    @board[0..2].each_with_index do |row,row_index|
      row.each_with_index do |space,space_index|
        victory_conditions.push([@board[row_index][space_index],@board[row_index+1][space_index-1],@board[row_index+2][space_index-2],@board[row_index+3][space_index-3]]) if space_index-3 >= 0
        victory_conditions.push([@board[row_index][space_index],@board[row_index+1][space_index],@board[row_index+2][space_index],@board[row_index+3][space_index]])
        victory_conditions.push([@board[row_index][space_index],@board[row_index+1][space_index+1],@board[row_index+2][space_index+2],@board[row_index+3][space_index+3]]) if space_index+3 <= 6
      end
    end
    # adds victory conditions for all rows
    @board.each do |row|
      victory_conditions.push(row[0..3])
      victory_conditions.push(row[1..4])
      victory_conditions.push(row[2..5])
      victory_conditions.push(row[3..6])
    end
    # checks if victory condition achieved
    if victory_conditions.any? { |four| four.all? { |space| space == piece } }
      true
    else
      false
    end 
  end
  
  def tie?
    if (@board.all? { |four| four.all? { |space| space == "ϴ" || space == "Ϯ" } }) && !(victory?("ϴ") || victory?("Ϯ"))
      true
    else
      false
    end
  end
  
  def player_move(piece)
    move = gets.chomp.to_i
    if (1..7).to_a.include?(move) && !(@board.all? { |row| row[move-1] == "ϴ" || row[move-1] == "Ϯ" })
      place_piece(piece,move)
      @moves_count += 1
    else
      puts "Please enter a valid number!"
    end
  end

end

# game = ConnectFour.new
# game.start
