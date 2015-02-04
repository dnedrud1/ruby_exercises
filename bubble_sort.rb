def bubble_sort (to_sort)
  new_sort = to_sort
  old_sort = []
  until old_sort == new_sort
    counter = 0
    while counter < new_sort.length - 1
      old_sort[counter], old_sort[counter + 1] = new_sort[counter], new_sort[counter + 1]
      if new_sort[counter] > new_sort[counter + 1]
        new_sort[counter], new_sort[counter + 1] = new_sort[counter + 1], new_sort[counter]
      end
      counter += 1
    end
  end
  p new_sort
end

def bubble_sort_by (to_sort)
  new_sort = to_sort
  old_sort = []
  until old_sort == new_sort
    counter = 0
    while counter < new_sort.length - 1
      old_sort[counter], old_sort[counter + 1] = new_sort[counter], new_sort[counter + 1]
      if yield(new_sort[counter], new_sort[counter + 1]) < 0
        new_sort[counter], new_sort[counter + 1] = new_sort[counter + 1], new_sort[counter]
      end
      counter += 1
    end
  end
  p new_sort
end


bubble_sort([4,3,78,2,0,2,100,-1])

bubble_sort_by(["hi","hello","hey","h","howyadoin?"]) do |left,right|
  right.length - left.length
end
