class BinaryTree
    attr_accessor :root, :size

    class Node
        attr_accessor :parent, :left, :right, :data

        def initialize parent, data
            self.parent = parent
            self.data = data
        end

        def to_s
            puts "root: #{self.data}"
            puts "left: #{self.left&.data}"
            puts "right: #{self.right&.data}"
        end
    end

    def initialize data
        self.root = Node.new nil, data
        self.size = 1
    end

    def insert_left node, data
        return unless node
        raise "can't override nodes." if node.left

        self.size += 1
        node.left = Node.new node, data
    end

    def insert_right node, data
        return unless node
        raise "can't override nodes." if node.right

        self.size += 1
        node.right = Node.new node, data
    end

    def remove_left node
        if node&.left
            remove_left node.left
            remove_right node.left
            node.left = nil
            self.size -= 1
        end
    end
    
    def remove_right node    
        if node&.right    
            remove_left node.right
            remove_right node.right
            node.right = nil
            self.size -= 1
        end
    end

	def preorder node
		return unless node

		puts node.data
		preorder node.left
		preorder node.right
	end

    def inorder node
		return unless node

		inorder node.left
		puts node.data
		inorder node.right
    end

	def postorder node
		return unless node

		postorder node.left
		postorder node.right
		puts node.data
	end
end