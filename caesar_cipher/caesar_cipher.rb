# Caesar Cipher
# by Daniel Nedrud
# 12/10/2014

class Caesar

  # Adjusts very small and very large numbers to between 26 and 1
	def get_right_number (number)
		until number < 26 && number > 1
			if number > 26
				number -= 26
			elsif number < 1
				number += 26
			end
		end
		number
	end

	def change_letter(letter, alphabet, changer)
		changer = get_right_number(changer)
			if alphabet.index(letter) < (26 - changer)
				letter = alphabet[(alphabet.index(letter)) + changer]
			else
				letter = alphabet[(alphabet.index(letter)) - (26-changer)]
			end
		letter
	end

	def cipher(text, number)
		cap_alphabet = ("A".."Z").to_a
		low_alphabet = ("a".."z").to_a
		text.split("").each_with_index do |current,index|
			if cap_alphabet.include?(current)
				text[index] = change_letter(current, cap_alphabet, number)
			elsif low_alphabet.include?(current)
				text[index] = change_letter(current, low_alphabet, number)
			end
		end
		text
	end

end

# puts Caesar.new.cipher('What do you do with a drunken sailor?',5)

