# A game of mastermind
# by Daniel Nedrud
# 10/30/2014

class Game

	def initialize
		@code = []
		@colors = [:r, :o, :y, :g, :b, :p]
		@board = []
	end
	
	def start
		puts "Please enter \"player\" if you wish to guess the computer's code."
		puts "Please enter \"computer\" if you wish to have the computer guess your code."
		answer = gets.chomp.downcase
		until answer == "player" || answer == "computer"
			puts "Please enter a valid choice."
			answer = gets.chomp.downcase
		end
		case answer
		when "player"
			player_start()
		when "computer"
			computer_start()
		else
		end
	end
	
	def player_start
	  tries = 12
	
	  4.times do
	    @code.push(@colors[rand(@colors.length)])
    end
    
    puts "Guess the code in 12 tries by entering four colors!"
    puts "Select from red, orange, yellow, green, blue and purple (only type the first letter of the word)."
    puts "e.g. rgpo"
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
  
  def computer_start
	  tries = 12
	
	  puts "Enter the secret code!"
	  puts "Select four colors from red, orange, yellow, green, blue and purple (only type the first letter of the word)."
    puts "e.g. rgpo"
    
    @guess = gets.chomp.split("").map { |i| i.downcase.strip.to_sym } 
    sanitize_input()
    @code = @guess
    
    puts "Thank you! The computer will now attempt to guess you code!"
    
    computer_guess = []
    4.times do
	    computer_guess.push(@colors[rand(@colors.length)])
    end
    
		until victory(computer_guess)
		  last_computer_guess = computer_guess.map { |i| i }
		  tries -= 1
		  @board.push(computer_guess)
		  @board.push(give_clues(computer_guess))
		  
		  puts "---------------"
		  puts "Guess again! (#{tries} tries remaining)"
		  @board.each { |i| p i }
			computer_guess = []
			4.times do
				computer_guess.push(@colors[rand(@colors.length)])
			end
			
			last_computer_guess.each_with_index do |item, index|
			  if item == @code[index]
			  	computer_guess[index] = item
		  	end
	  	end
		  
		  return puts "You won!" if tries <= 1
	  end
	  
	  puts "The computer beat you!" if tries > 0
    
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
game.start
