def fibs(number)
  start = [0]
  counter = 1
  (number-1).times do 
    start << counter
    counter = start[-2] + start[-1]
  end
  start
end

def fibs_rec(number, start = [0,1])
  return start.slice(0,1) if number == 1
  start << (start[-2] + start[-1])
  number == 2 ? start[0..-2] : fibs_rec(number - 1, start)
end

p fibs_rec(9)
  
p fibs(9)
