dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

def make_subwords (word)
	counter = 0
	final_array = []
	while counter < word.length
		counter2 = counter
		while counter2 < word.length
			final_array.push(word[counter..counter2].downcase)
			counter2 +=1
		end
		counter += 1
	end
	final_array
end

def substrings (sentence, dict_words)
	final_hash = {}
	words = make_subwords(sentence)
	words.each do |word|
		if dict_words.include?(word) && !(final_hash.has_key?(word))
			final_hash[word] = 1
		elsif dict_words.include?(word) && (final_hash.has_key?(word))
			final_hash[word] += 1
		end
	end
	p final_hash
end

substrings("Howdy partner, sit down! How's it going?", dictionary)
