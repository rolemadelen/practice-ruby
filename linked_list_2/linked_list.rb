class LinkedList
    attr_accessor :head 

    def initialize
        @head = nil
    end

    def add(value)
        if @head.nil?
            @head = Node.new(value)
        else
            lastNode = @head

            while !lastNode.nextNode.nil?
                lastNode = lastNode.nextNode
            end

            lastNode.nextNode = Node.new(value)
        end
    end

    def prepend(value)
        if @head.nil?
            @head = Node.new(value)
        else
            @head = Node.new(value, @head)
        end
    end

    def append(value)
        if @head.nil?
            @head = Node.new(value)
        else
            curr = @head

            while !curr.nextNode.nil?
                curr = curr.nextNode
            end

            curr.nextNode = Node.new(value)
        end
    end

    def display
        return puts "empty" if @head.nil?

        curr = @head

        while !curr.nextNode.nil?
            print "#{curr.value} -> "
            curr = curr.nextNode
        end

        puts curr.value
    end

    def remove(value)
        puts "[[ Remove #{value}]]"
        return nil if head.nil?
        return nil if find(value) == false
        curr = @head

        if @head.value == value 
            prev = @head
            @head = @head.nextNode
            prev = prev.nextNode = nil
        else
            while curr.nextNode && curr.nextNode.value != value 
                curr  = curr.nextNode
            end

            return nil if curr.nil?

            prev = curr.nextNode
            curr.nextNode = curr.nextNode.nextNode
            prev = prev.nextNode = nil
        end

        true
    end

    def find(value)
        curr = @head

        while !curr.nil?
            if curr.value == value 
                return true
            end

            curr = curr.nextNode
        end

        false
    end

    private

    class Node
        attr_accessor :value, :nextNode

        def initialize(value, nextNode = nil)
            @value = value
            @nextNode = nextNode
        end
    end

end

ll = LinkedList.new
ll.add(10)
ll.add(20)
ll.display

ll.prepend(17)
ll.prepend(20)
ll.display

ll.append(100)
ll.append(1)
ll.display

ll.remove(17)
ll.display

ll.remove(100)
ll.display

ll.remove(20)
ll.display

ll.remove(20)
ll.display

ll.remove(1)
ll.display

ll.remove(17)
ll.display

ll.remove(10)
ll.display