# Hangman
# by Daniel Nedrud
# 11/08/2014

class Game

  def initialize
    @words = File.readlines "5desk.txt"
  end
  
  def start
    eligible_words = @words.select { |i| i.length > 4 && i.length < 13 && i[0] == i[0].downcase}
    word = eligible_words[rand(eligible_words.length)].upcase.chomp
    wrong_guesses = 9
    wrong_letters = []
    correct_letters = []
    
    puts "Welcome to hangman!"
    
    until victory(word,correct_letters)
      puts "Guess a letter! (#{wrong_guesses} guesses remaining)"
      puts word_display(word,correct_letters) + "  Wrong Letters: #{wrong_letters.join(" ")}"
      guess = clean_guess(gets.chomp.upcase,correct_letters,wrong_letters)
      if word.split("").include?(guess)
      	correct_letters.push(guess)
    	else
    		wrong_letters.push(guess)
    		wrong_guesses -= 1
  		end
  		
  		return puts "Sorry, you didn't guess the word in time! It was \"#{word}\"." if wrong_guesses < 1
    end
    
    puts "You won! The word was \"#{word}\"!" if wrong_guesses > 0  
    
  end
  
  private
    
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
  
  def clean_guess(guess,right,wrong)
  	until ("A".."Z").to_a.include?(guess) && !right.include?(guess) && !wrong.include?(guess)
  		puts "Oops! Please enter a valid letter!"
  	  guess = gets.chomp.upcase
	  end
	  guess
  end
	  
  def victory(word,letters)
    if word.split("").all? { |i| letters.include?(i) }
    	true
  	else
  	  false
	  end
  end
  
end

Game.new.start
