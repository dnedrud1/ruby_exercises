def merge_sort(arr)
  if arr.length == 1
    return arr[0]
  else
  counter = 0
  new_array = []
    while counter < arr.length
      sorted_array = []
      a = arr[counter].class == Array ? arr[counter] : [arr[counter]].compact
      b = arr[counter + 1].class == Array ? arr[counter + 1] : [arr[counter + 1]].compact
      until a.length == 0 && b.length == 0
        if a[0] == nil
          sorted_array << b.shift
        elsif b[0] == nil
          sorted_array << a.shift
        elsif a[0] <= b[0]
          sorted_array << a.shift
        else
          sorted_array << b.shift
        end
      end
      new_array << sorted_array
      counter += 2
    end
  merge_sort(new_array)
  end
end

p merge_sort([1,99,3,8,-1,4,5,-7,8])
