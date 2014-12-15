class ConnectFour

  attr_accessor :board

  def initialize
    @board = []
    6.times { @board.push((0..6).to_a) }
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

end
