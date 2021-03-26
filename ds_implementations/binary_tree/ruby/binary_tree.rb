class Node
  attr_accessor :value, :left, :right

  def initialize value
    @value = value
    @left, @right = nil
  end

  def leaf?
    @left.nil? and @right.nil?
  end
end

class BinaryTree
  attr_accessor :root

  def initialize root
    @root = root
  end

  def bfs queue=[@root]
    until queue.empty?
      node = queue.shift

      print node.value, ", "

      queue.push(node.left) unless node.left.nil?
      queue.push(node.right) unless node.right.nil?
    end
    puts
  end

  def dfs node=@root
    return true if node.nil?

    print node.value, ", "
    self.dfs(node.left) and self.dfs(node.right)
  end

  def shortest_path queue=[@root]
    depth = 0
    until queue.empty?
      (2 ** depth).times do 
        node = queue.shift

        # will always return
        return depth + 1 if node.leaf?

        queue.push(node.left) unless node.left.nil?
        queue.push(node.right) unless node.right.nil?
      end 
      depth += 1
    end
  end
end

bt = BinaryTree.new Node.new 3
bt.root.right = Node.new 7
bt.root.left = Node.new 4
bt.root.right.right = Node.new 9
bt.root.right.left = Node.new 8
bt.root.left.right = Node.new 6
bt.root.left.left = Node.new 5
bt.root.left.left.left = Node.new 10

bt.dfs
