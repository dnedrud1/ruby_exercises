# A game of mastermind
# by Daniel Nedrud
# 10/30/2014

class Game

	def initialize
		@code = []
		@colors = [:r, :o, :y, :g, :b, :p]
		@board = []
	end
	
	def player_start
	  tries = 12
	
	  4.times do
	    @code.push(@colors[rand(@colors.length)])
    end
    
    puts "Guess the code in 12 tries by entering four colors!"
    puts "Select your four from red, orange, yellow, green, blue and purple (only type the first letter of the word)."
    @guess = gets.chomp.split("").map { |i| i.downcase.strip.to_sym } 
    sanitize_input()
    
		until victory(@guess)
		  tries -= 1
		  @board.push(@guess)
		  @board.push(give_clues(@guess))
		  
		  puts "---------------"
		  puts "Guess again! (#{tries} tries remaining)"
		  @board.each { |i| p i }
		  @guess = gets.chomp.split("").map { |i| i.downcase.strip.to_sym }
		  sanitize_input()
		  
		  return puts "Sorry, you ran out of tries!" if tries <= 1
	  end
	  
	  puts "You won!" if tries > 0
    
  end
  
  private
  
  def sanitize_input
  	until @guess.all? { |i| @colors.include?(i) } && @guess.count == 4
    	puts "Oops! Please enter valid input like this: rgyb"
    	@guess = gets.chomp.split("").map { |i| i.downcase.strip.to_sym }
  	end
	end

  def give_clues(attempt)
    code_holder = @code.map { |i| i }
    attempt_holder = attempt.map { |i| i }
    perfect_match = 0
    match = 0
    attempt_holder.each_with_index do |item, index|
    	if item == code_holder[index]
    		perfect_match += 1
    		code_holder[index] = "blank_answer"
    		attempt_holder[index] = "blank_guess"
  		end
		end
		attempt_holder.each do |i|
			if code_holder.include?(i)
				match += 1
			end
		end
   	"Perfect Matches: #{perfect_match}, Color Matches: #{match}"
  end
  
  def victory(attempt)
  	if attempt == @code
  		true
		else
			false
		end
  end
  
end


game = Game.new
game.player_start
