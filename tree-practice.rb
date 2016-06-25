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

def operators(node)
  return if node == nil
  operators(node.left)
  if node.left !=  nil && node.right != nil
    print node.value + " "
  end
  operators(node.right)
end

root = TreeNode.new("+")
root.left = TreeNode.new("3")
root.right = TreeNode.new("2")
puts print_infix(root)
puts operators(root)

root2 = TreeNode.new("-")
root2.left = TreeNode.new("+")
root2.left.left = TreeNode.new("3")
root2.left.right = TreeNode.new("2")
root2.right = TreeNode.new("10")
puts print_infix(root2)
puts operators(root2)

root3 = TreeNode.new("+")
root3.left = TreeNode.new("*")
root3.left.left = TreeNode.new("4")
root3.left.right = TreeNode.new("3")
root3.right = TreeNode.new("2")
puts print_infix(root3)
puts operators(root3)

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














#
