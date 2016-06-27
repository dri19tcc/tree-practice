class TreeNode
   attr_accessor :value, :left, :right

   def initialize(val)
     @value = val
     @left = nil
     @right = nil
   end
end

def print_infix(node)
  return if node == nil
  print_infix(node.left)
  print node.value + " "
  print_infix(node.right)
end

def print_postfix(node)
  return if node == nil
  print_postfix(node.left)
  print_postfix(node.right)
  print node.value + " "
end

def print_prefix(node)
  return if node == nil
  print node.value + " "
  print_prefix(node.left)
  print_prefix(node.right)
end

def operators(node)
  return if node == nil
  operators(node.left)
  if node.left !=  nil || node.right != nil
    print node.value + " "
  end
  operators(node.right)
end

# def operator_2(node, operands = nil)
#   return if node == nil
#   operands = []
#   operator_2(node.left, operands)
#   if node.left !=  nil || node.right != nil
#     operands << node.value
#     print operands.join + " "
#   end
#   operator_2(node.right, operands)
# end

def exist(node, operator, counter = 0)
  return counter if node == nil
  counter = exist(node.left, operator, counter)
  if node.value == operator
    counter += 1
  end
  exist(node.right, operator, counter)
end

def leaf(node, counter = 0)
  return counter if node == nil
  counter = leaf(node.left, counter)
  if node.left ==  nil && node.right == nil
    counter += 1
  end
  leaf(node.right, counter)
end

root = TreeNode.new("+")
root.left = TreeNode.new("3")
root.right = TreeNode.new("2")
puts print_infix(root)
puts operators(root)
puts leaf(root)
puts print_postfix(root)
puts print_prefix(root)
puts "exist for root" + exist(root, "+").to_s

root2 = TreeNode.new("-")
root2.left = TreeNode.new("+")
root2.left.left = TreeNode.new("3")
root2.left.right = TreeNode.new("2")
root2.right = TreeNode.new("10")
puts print_infix(root2)
puts operators(root2)
puts leaf(root2)
puts print_postfix(root2)
puts print_prefix(root2)
puts "exist for root" + exist(root2, "+").to_s

root3 = TreeNode.new("+")
root3.left = TreeNode.new("*")
root3.left.left = TreeNode.new("4")
root3.left.right = TreeNode.new("3")
root3.right = TreeNode.new("2")
puts print_infix(root3)
puts operators(root3)
puts leaf(root3)

root4 = TreeNode.new("-")
root4.left = TreeNode.new("+")
root4.left.right = TreeNode.new("2")
root4.left.left = TreeNode.new("*")
root4.left.left.left = TreeNode.new("4")
root4.left.left.right = TreeNode.new("3")
root4.right = TreeNode.new("%")
root4.right.left = TreeNode.new("10")
root4.right.right = TreeNode.new("5")
puts print_infix(root4)
puts operators(root4)
puts leaf(root4)

root5 = TreeNode.new("-")
root5.left = TreeNode.new("-")
root5.left.right = TreeNode.new("2")
root5.left.left = TreeNode.new("*")
root5.left.left.left = TreeNode.new("4")
root5.left.left.right = TreeNode.new("3")
root5.right = TreeNode.new("*")
root5.right.left = TreeNode.new("10")
root5.right.right = TreeNode.new("5")
puts print_infix(root5)
# puts operator_2(root5)
puts leaf(root5)
puts exist(root5, "-")
