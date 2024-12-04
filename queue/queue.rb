class Queue 
    attr_accessor :head, :tail, :length 

    def initialize 
        @head = nil
        @tail = nil 
        @length = 0
    end

    def enqueue data
        node = Node.new data 

        if @head 
            @tail.next = node
            @tail = node
        else
            @head = node
            @tail = node
        end

        @length += 1
    end

    def dequeue
        return nil unless @length > 0

        if @length == 1
            @head = @tail = nil
        else
            @head = @head.next
        end

        @length -= 1
    end

    def peek
        return nil unless @head
        @head.data
    end

    def clear
        until @length == 0 
            self.dequeue
        end
    end

    def each
        return nil unless block_given?

        curr = @head
        while curr
            yield curr
            curr = curr.next
        end
    end

    def print
        return nil unless @length > 0

        each { |node| puts node.data }
    end

    private
    class Node
        attr_accessor :next, :data

        def initialize data
            @data = data
            @next = nil
        end
    end
end