# Enumerable Methods
# by Daniel Nedrud
# 12/11/2014

# This module contains enumerable methods meant to emulate built in enumerable methods in Array class.
module Enumerable

  def my_each
    counter = 0
    while counter < self.length
      yield(self[counter])
      counter += 1
    end
    self    
  end
  
  def my_each_with_index
    counter = 0
    while counter < self.length
      yield(self[counter], counter)
      counter += 1
    end
    self    
  end
  
  def my_select
    counter = 0
    new_array = []
    while counter < self.length
    	if yield(self[counter]) == true
        new_array.push(self[counter])
      end
      counter += 1
    end
    new_array   
  end
  
  def my_all?
    counter = 0
    final_tally = 0
    answer = false
    while counter < self.length
    	if yield(self[counter]) == true
        final_tally += 1
      end
      counter += 1
    end
    if final_tally == self.length
      answer = true
    end
    answer
  end
  
  def my_any?
    counter = 0
    answer = false
    while counter < self.length
    	if yield(self[counter]) == true
        answer = true
      end
      counter += 1
    end
    answer
  end
  
  def my_none?
    counter = 0
    answer = true
    while counter < self.length
    	if yield(self[counter]) == true
        answer = false
      end
      counter += 1
    end
    answer
  end
  
  def my_count
    counter = 0
    self.my_each do |i|
      counter += 1
    end
    counter
  end
  
  def my_map(proc_to_call)
    new_array = []
    self.my_each do |i|
    	new_array.push(proc_to_call.call(block_given? ? yield(i) : i))
    end
    new_array
  end
  
  def my_inject(start = "argument_was_not_passed")
  	if start != "argument_was_not_passed"
			answer = start
			self.my_each do |i|
				answer = yield(start,i)
				start = answer
			end
		else
			start = self[0]
			self[1..-1].my_each do |i|
				answer = yield(start,i)
				start = answer
			end
		end
		answer
	end
	
end

def multiply_els(array_of_nums)
  array_of_nums.my_inject(1) {|i,j| i * j}
end

# nums = [2,9,4,32,7434]
# my_proc = Proc.new { |arg1| arg1 * 2 }

# p nums.my_map(my_proc) { |i| i * 2 }
