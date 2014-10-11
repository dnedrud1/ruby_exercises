def get_right_number (number)
	new_number = number
	while new_number > 26 or new_number < 1
		if new_number > 26
			new_number -= 26
		elsif new_number < 1
			new_number += 26
		end
	end
	new_number
end

def change_letter(letter, alphabet, changer)
	answer = letter
	changer2 = get_right_number(changer)
		if alphabet.index(letter) < (26 - changer2)
			answer = alphabet[(alphabet.index(letter)) + changer2]
		else
			answer = alphabet[(alphabet.index(letter)) - (26-changer2)]
		end
	answer
end
		

def caesar_cipher(text, number)
	cap_alphabet = ("A".."Z").to_a
	low_alphabet = ("a".."z").to_a
	new_text = text
	counter = 0
	while counter < new_text.length
		current = new_text[counter]
		if cap_alphabet.include?(current)
			new_text[counter] = change_letter(current, cap_alphabet, number)
		elsif low_alphabet.include?(current)
			new_text[counter] = change_letter(current, low_alphabet, number)
		end
		counter += 1
	end
	new_text
end

puts caesar_cipher("What a string!", 5)

