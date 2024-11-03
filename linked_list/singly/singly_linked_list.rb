class SinglyLinkedList
    attr_accessor :head, :tail, :length

    class Node
        attr_accessor :data, :next

        def initialize  data, pointer
            @data = data
            @next = pointer
        end
    end

    def initialize
        self.head = nil
        self.tail = nil
        self.length = 0
    end

    def insert data
        node = Node.new data 
        unless head
            self.head = node
        else
            self.tail.next = node
        end
        self.tail = node
        self.length += 1
    end

    def remove node
        return nil unless node

        if node == head
            if head.next.nil?
                self.head = self.tail = nil
            else
                self.head = self.head.next
            end
        else
            tmp = self.head
            while tmp && tmp.next != node
                tmp = tmp.next
            end
            tmp.next = node.next if tmp
        end
        self.length -= 1
    end

    def cat list
        return nil unless list

        self.tail.next = list.head
        self.length += list.length
    end

    def clear
        while self.length > 0
            remove self.head
        end
    end

    def find_first predicate
    end

    def print
    end
end