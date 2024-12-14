class BinaryTree
    def initialize
        self.size = 0
        @root     = nil
    end

    def insert_left node, data
    end

    def insert_right node, dataa
    end

    def remove_left node
    end

    def remove_right node
    end

    def merge left, right
    end

    def print_dfs
    end

    def print_bfs
    end

    private
    class Node
        attr_accessor :parent, :left, :right, data

        def initialize data, parent=nil, left=nil, right=nil
            self.parent = parent
            self.left = left
            self.right = right
            self.data = data
        end
    end
end