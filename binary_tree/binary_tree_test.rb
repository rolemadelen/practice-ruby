require 'test/unit'
require_relative "binary_tree.rb"

class BinaryTreeTest < Test::Unit::TestCase
    def test_initialize
        tree = BinaryTree.new 15

        assert(tree.root.data == 15, "root of the tree")
        assert(tree.size == 1, "root")
    end

    def test_insert_left
        tree = BinaryTree.new 15

        assert(tree.root.left.nil?, "[15, nil, nil]")
        assert(tree.root.right.nil?, "[15, nil, nil]")

        tree.insert_left tree.root, 10
        assert(tree.root.left.data == 10, "[15,10,nil,nil,nil]")
        assert(tree.size == 2, "[15,10,nil,nil,nil]")

        tree.insert_left tree.root.left, 20
        assert(tree.root.left.left.data == 20, "[15,10,nil,20,nil]")
        assert(tree.size == 3, "[15,10,nil,20,nil]")
    end
    
    def test_insert_right
        tree = BinaryTree.new(15)

        assert(tree.root.left.nil?, "[15, nil, nil]")
        assert(tree.root.right.nil?, "[15, nil, nil]")

        tree.insert_right tree.root, 10
        assert(tree.root.right.data == 10, "[15,nil,10,nil,nil]")
        assert(tree.size == 2, "[15,nil,10,nil,nil]")

        tree.insert_right tree.root.right, 20
        assert(tree.root.right.right.data == 20, "[15,nil,10,nil,20]")
        assert(tree.size == 3, "[15,nil,10,nil,20]")
    end

    def test_insert_left_and_right
        tree = BinaryTree.new(13)
        root = tree.root

        tree.insert_left  root, 8
        tree.insert_right root, 17

        tree.insert_left  root.left,  1
        tree.insert_right root.left, 11
        tree.insert_left  root.right, 15
        tree.insert_right root.right, 25

        assert(tree.root.data == 13, "root")
        assert(tree.root.left.data  == 8,  "root.left")
        assert(tree.root.right.data == 17, "root.right")

        assert(tree.root.left.left.data   == 1,  "root.left.left")
        assert(tree.root.left.right.data  == 11, "root.left.right")
        assert(tree.root.right.left.data  == 15, "root.right.left")
        assert(tree.root.right.right.data == 25, "root.right.right")
    end

    def test_remove_left
        tree = BinaryTree.new(13)
        tree.insert_left  tree.root, 8
        tree.insert_right tree.root, 17
        tree.insert_left  tree.root.left,  1
        tree.insert_right tree.root.left, 11
        tree.insert_left  tree.root.right, 15
        tree.insert_right tree.root.right, 25

        assert(tree.size == 7, "tree with 7 nodes")

        tree.remove_left tree.root.left
        assert(tree.size = 5, "tree with 5 nodes")
    end

    def test_remove_right
        tree = BinaryTree.new(13)
        root = tree.root

        tree.insert_left  root, 8
        tree.insert_right root, 17
        tree.insert_left  root.left,  1
        tree.insert_right root.left, 11
        tree.insert_left  root.right, 15
        tree.insert_right root.right, 25
    end
end