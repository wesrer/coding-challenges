require 'test/unit'

class Node
  attr_accessor :value, :left, :right

  def initialize value
    @value = value
    @left, @right = nil
  end

  def leaf?
    @left.nil? and @right.nil?
  end

  def vprint
    print self.value, ", "
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

      node.vprint

      queue.push(node.left) unless node.left.nil?
      queue.push(node.right) unless node.right.nil?
    end
    puts
  end

  def dfs node=@root
    return true if node.nil?

    node.vprint

    self.dfs(node.left) and self.dfs(node.right)
  end

  def shortest_path queue=[@root]
    depth = 0
    until queue.empty?
      (2 ** depth).times do
        node = queue.shift

        next if node.nil?

        # will always return
        return depth + 1 if node.leaf?

         # NOTE: Inititally I wasn't adding nodes if they were nil,
         #       but then the logic for finding the depth becomes really difficult
         #       because balanced and unbalanced trees have different depth calculations.
         #       This method is simpler, in exchange of added space/time complexity.
        queue.push(node.left, node.right)
      end
      depth += 1
    end
  end
end

class TestCases < Test::Unit::TestCase

  def test_complete_bt
    bt = BinaryTree.new Node.new 3
    bt.root.right = Node.new 7
    bt.root.left = Node.new 4
    bt.root.right.right = Node.new 9
    bt.root.right.left = Node.new 8
    bt.root.left.right = Node.new 6
    bt.root.left.left = Node.new 5
    bt.root.left.left.left = Node.new 10

    assert_equal(bt.shortest_path, 3)
  end

  def test_incomplete_bt
    bt = BinaryTree.new Node.new 3
    bt.root.right = Node.new 6
    bt.root.left = Node.new 4
    bt.root.left.left = Node.new 7
    bt.root.right.right = Node.new 5
    bt.root.right.right.right = Node.new 12
    bt.root.left.left.left = Node.new 10
    bt.root.left.left.left.left = Node.new 11

    puts
    assert_equal(bt.shortest_path, 4)
  end
end