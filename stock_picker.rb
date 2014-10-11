def stock_picker (stocks)
	cap = 0
	counter = 0
	answer = []
	while counter < stocks.length
		counter2 = counter + 1
		while counter2 < stocks.length
			if (stocks[counter2] - stocks[counter]) > cap
				cap = stocks[counter2] - stocks[counter]
				answer = [counter, counter2]
			end
			counter2 += 1
		end
		counter += 1
	end
	p answer
	puts "Your profit is $#{cap}."
end

stock_picker([1,3,6,9,15,8,6,1,10])
