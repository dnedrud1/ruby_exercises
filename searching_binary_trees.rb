# Practicing with Depth-First-Searching and Breadth-First-Searching
# Daniel Nedrud
# 12/04/2014

# Note: This code needs refactoring. It is way too long and messy. When I get time I will come back to this.



# This is the class of objects that will be used to build the tree I am searching.
# Note: Remove getter and setter methods. Just use att_accessor. And don't make the values arrays.
class Node
  
  attr_accessor :value

  def initialize(value)
    @value = value
    @parent = []
    @left_child = []
    @right_child = []
  end
  
  def create_parent(i)
    @parent.push(i)
  end
  
  def find_parent
    return @parent
  end
  
  def create_left_child(i)
    @left_child.push(i)
  end
  
  def find_left_child
    return @left_child
  end
  
  def create_right_child(i)
    @right_child.push(i)
  end
  
  def find_right_child
    return @right_child
  end
  
end

# Creates tree with Node objects.
# Note: DRY!
def build_tree(arr)

tree = []

tree.push(Node.new(arr[0]))

	arr[1..-1].each do |i|
		new_node = Node.new(i)

		condition = false
		current = tree[0]
		until condition == true
		  if i > current.value && current.find_right_child.count == 0
		    new_node.create_parent(current)
				current.create_right_child(new_node)
				tree.push(new_node)
				condition = true
		  elsif i < current.value && current.find_left_child.count == 0
		    new_node.create_parent(current)
				current.create_left_child(new_node)
				tree.push(new_node)
				condition = true
		  elsif i > current.value && current.find_right_child.count == 1
		    current = current.find_right_child[0]
		  elsif i < current.value && current.find_left_child.count == 1
		    current = current.find_left_child[0]
		  end
		end
	end
  tree
end

# Method to display nodes, children, and parents.
def see_tree(tree)
	tree.each do |i|
		puts "---------------"
		puts "Node: #{i.value}"
		puts "Parent: " + i.find_parent[0].value.to_s if i.find_parent.count > 0
		puts "Left Child: " + i.find_left_child[0].value.to_s if i.find_left_child.count > 0
		puts "Right Child: " + i.find_right_child[0].value.to_s if i.find_right_child.count > 0
  end
end

# Method for BFS
# Note: Not as bad as the next one. Could still use refactoring.
def breadth_first_search(find,tree)
  current = tree[0]
  answer = ""
  queue = []
  visited = [tree[0]]
  
  condition = false
  until condition == true
    connections = [current.find_right_child[0],current.find_left_child[0]].compact
    if current.value == find
		  answer = current
			condition = true
		elsif visited.count == tree.count
		  answer = nil
		  condition = true
		else
		  connections.each do |i|
				if i.value == find
				  answer = i
				  condition = true
			  elsif !visited.include?(i)
			    visited.push(i)
			    queue.push(i)
			  end
	    end
	  end
	  current = queue.shift
  end
  puts answer ? answer : "Value not found!"
  puts answer.value if answer != nil
end

# Method for DFS
# Note: Awful. Way too many if/else statements. Badly needs refactoring.
def depth_first_search(find,tree)
  current = tree[0]
  answer = ""
  stack = [tree[0]]
  visited = [tree[0]]
  
  condition = false
  until condition == true
    connections = [current.find_right_child[0],current.find_left_child[0]].compact
    puts current.value
    puts connections.count
    puts "---"
    
    if current.value == find
		  answer = current
			condition = true
		elsif visited.count == tree.count
		  answer = nil
		  condition = true
		else
		  if connections.count < 1
		    stack.pop
		    current = stack[-1]
	    elsif connections.count == 1
	      if visited.include?(connections[0])
				  stack.pop
				  current = stack[-1]
	      else
	        current = connections[0]
	        stack.push(current)
	        visited.push(current)
	      end
	    else
	      if visited.include?(connections[0]) && visited.include?(connections[1])
				  stack.pop
				  current = stack[-1]
	      elsif !visited.include?(connections[0])
	        current = connections[0]
	        stack.push(current)
	        visited.push(current)
	      else
	        current = connections[1]
	        stack.push(current)
	        visited.push(current)
	      end
	    end
	  end
  end
  puts answer ? answer : "Value not found!"
  puts answer.value if answer != nil
end

# Recursive method for DFS
# Note: Might be ok to leave as is.
def dfs_rec(target,current,array_length,stack,visited)
  left = current.find_left_child[0]
  right = current.find_right_child[0]
  parent = current.find_parent[0]
  if current.value == target
    return current
  elsif visited.length == array_length
    return nil
  elsif !left.nil? && !visited.include?(left)
    stack.push(left)
	visited.push(left)
    dfs_rec(target,left,array_length,stack,visited)
  elsif !right.nil? && !visited.include?(right)
    stack.push(right)
	visited.push(right)
    dfs_rec(target,right,array_length,stack,visited)
  else
    stack.pop
	dfs_rec(target,parent,array_length,stack,visited)
  end
end

a = build_tree([11, 1, 7, 4, 23, 8, 3, 5, 9, 67, 6345, 324])
answer = dfs_rec(22,a[0],12,[a[0]],[a[0]])

