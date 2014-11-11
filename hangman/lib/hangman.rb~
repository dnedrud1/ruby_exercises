# Hangman
# by Daniel Nedrud
# 11/08/2014

require 'yaml'

class Game

  def initialize (wrong = [], correct = [], guesses = 9, saved_word = nil)
    @wrong_letters = wrong
    @correct_letters = correct
    @wrong_guesses = guesses
    @word = saved_word
  end
  
  # This is the method the user should call to start a game of Hangman.
  # It gives you the option of starting from scratch or loading a saved file.
  def start
    puts "Welcome to Hangman!"
    puts "Please enter \"play\" to start a new game or enter \"load\" to pick up an existing game."
    response = gets.chomp.downcase
    
    until response == "play" || response == "load"
    	puts "Oops! Please enter \"play\" or \"load\"."
    	response = gets.chomp.downcase
  	end
  	
  	case response
  	when "play"
  	  Game.new.play
	  when "load"
	  	puts "Please enter the name of your saved file."
	  	name = gets.chomp
	    file = File.open("saves/#{name}.txt", "r")
			contents = file.read
			yaml = YAML::load(contents).play
		end
	end
	  
  # This method is called to start a game of Hangman whether from a saved file or from scratch.
  def play
  	words = File.readlines "5desk.txt"
    eligible_words = words.select { |i| i.length > 4 && i.length < 13 && i[0] == i[0].downcase}
    
    # Chooses a random word if one hasn't been loaded.
    @word ||= eligible_words[rand(eligible_words.length)].upcase.chomp
    
    until victory(@word,@correct_letters)
      puts "Guess a letter! (#{@wrong_guesses} guesses remaining)"
      puts "You can also enter \"save\" at any time to save your game."
      puts word_display(@word,@correct_letters) + "  Wrong Letters: #{@wrong_letters.join(" ")}"
      guess = clean_guess(gets.chomp.upcase,@correct_letters,@wrong_letters)
      
      # This case statment gives the player the option of either saving their game or guessing a letter.
      # Any other input will require them to guess again as mandated by the "clean_guess" method.
      case guess
      when "SAVE"
        puts "Please enter a name for your file."
  		  name = gets.chomp
  		  save(name)
		  else    	
		    if @word.split("").include?(guess)
		    	@correct_letters.push(guess)
		  	else
		  		@wrong_letters.push(guess)
		  		@wrong_guesses -= 1
				end
			end
			
  		return puts "Sorry, you didn't guess the word in time! It was \"#{@word}\"." if @wrong_guesses < 1
    end
    
    puts "You won! The word was \"#{@word}\"!" if @wrong_guesses > 0  
    
  end
  
  private
    
  # This method returns how the random word will be displayed. Any unguessed letters will display as dashes.
  def word_display(word,letters)
    word_arr = word.split("")
    display_arr = []
    word_arr.each do |letter|
      if letters.include?(letter)
        display_arr.push(letter)
      else
        display_arr.push("_")
      end
    end
    display_arr.join(" ")
  end
  
  # This method continues to hound you for input until you give it either an unguessed letter or "save".
  def clean_guess(guess,right,wrong)
		until (("A".."Z").to_a.include?(guess) && !right.include?(guess) && !wrong.include?(guess)) || guess == "SAVE"
			puts "Oops! Please enter a valid letter!"
			guess = gets.chomp.upcase
		end
	  guess
  end
	  
	# Victory is achieved when this method returns the boolean "true".
  def victory(word,letters)
    if word.split("").all? { |i| letters.include?(i) }
    	true
  	else
  	  false
	  end
  end
  
  # Saves the player's current position in YAML format to a file of their choice in the folder "saves".
  def save (name)
  	yaml = YAML::dump(self)
  	file_name = "#{name}.txt"
  	File.open("saves/" + file_name, "w") { |i| i.write(yaml) }
  end
  
end

Game.new.start
