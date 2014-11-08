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
    missed_letters = []
    correct_letters = []
    
    puts "Welcome to hangman!"
    puts "Guess a letter!"
    puts word_display(word,correct_letters)
    
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
      
end

Game.new.start
