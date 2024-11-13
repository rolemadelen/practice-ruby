class SinglyLinkedList
    attr_accessor :head, :tail, :length

    class Node
        attr_accessor :data, :next

        def initialize  data=nil, pointer=nil
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
            self.head.next = self.tail
        else
            self.tail.next = node
        end
        self.tail = node
        self.length += 1
    end

    def remove node
        return nil unless node

        if node == self.head
            if self.head.next.nil?
                self.head = self.tail = nil
            else
                self.head = self.head.next
            end
        elsif node == self.tail
            tmp = self.head
            while tmp && tmp.next != self.tail
                tmp = tmp.next
            end
            tmp.next = nil
            self.tail = tmp
        else
            tmp = self.head
            while tmp && tmp.next != node
                tmp = tmp.next
            end
            tmp.next = node.next if tmp
            self.tail = tmp
        end
        self.length -= 1
    end

    def cat list
        return nil unless list

        self.tail.next = list.head
        self.length += list.length

        self.tail = list.tail
    end

    def clear
        while self.length > 0
            remove self.head
        end
    end

    def find_first &predicate
        return nil unless block_given?

        current = self.head
        while current
            return current if predicate.call(current)
            current = current.next
        end
    end

    def each
        return nil unless block_given?

        current = self.head
        while current
            yield current
            current = current.next
        end
    end

    def display
        if self.length == 0
            puts "empty"
        else
            self.each { |item| puts item.data } 
        end
    end
end

list = SinglyLinkedList.new
list.insert(1)
list.insert(2)
list.insert(3)
list.insert(4)
list.insert(5)
list.display