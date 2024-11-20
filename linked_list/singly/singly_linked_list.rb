class SinglyLinkedList 
    attr_accessor :head, :tail, :length

    class Node
        attr_accessor :data, :next

        def initialize(item)
            @data = item
            @next = nil
        end
    end

    def initialize 
        @head = nil
        @tail = nil
        @length = 0
    end

    def insert item 
        new_node = Node.new(item)

        if @head == nil 
            @head = new_node
            @tail = new_node
        else
            @tail.next = new_node
            @tail = @tail.next
        end

        @length += 1
    end

    def pop_back
        return nil unless @tail
        ret = nil

        if @head == @tail 
            ret = @head.data
            @head = nil
            @tail = nil
        else
            curr = @head

            while curr && curr.next != @tail
                curr = curr.next
            end

            ret = curr.next.data
            curr.next = nil
            @tail = curr
        end

        @length -= 1
        ret
    end

    def pop_front
        return nil unless @head
        ret = nil

        if @head == @tail
            ret = @head.data
            @head = nil
            @tail = nil
        else
            ret = @head.data
            @head = @head.next
        end

        @length -= 1
        ret
    end

    def remove item
        return nil unless head

        return pop_front if @head.data == item 
        return pop_back if @tail.data == item 

        curr = @head

        while curr && curr.next
            if curr.next.data == item 
                curr.next = curr.next.next
                @length -= 1
                return
            end
            curr = curr.next
        end

        nil
    end

    def cat list
        if @head == nil
            @head = list.head
            @tail = list.tail
        else
            @tail.next = list.head
            @tail = list.tail
        end

        @length += list.length
        list = nil
    end

    def clear
        while @length > 0
            pop_front
        end
    end

    def find_first &predicate
        return nil unless block_given?

        curr = @head
        while curr
            return curr if predicate.call(curr)
            curr = curr.next
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

    def display
        return nil unless @length > 0

        each {|item| puts item.data }
    end
end