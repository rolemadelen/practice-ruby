class DoublyLinkedList 
    attr_accessor :head, :tail, :length

    class Node
        attr_accessor :data, :next, :prev

        def initialize(item, prev_ptr=nil, next_ptr=nil)
            @data = item
            @prev = prev_ptr
            @next = next_ptr
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
            new_node.prev = @tail
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
            ret = @tail.data
            @tail = @tail.prev
            @tail.next = nil
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
            @head.prev = nil
        end

        @length -= 1
        ret
    end

    def remove item
        return nil unless head

        return pop_front if @head.data == item 
        return pop_back if @tail.data == item 

        curr = @head

        while curr
            if curr.data == item 
                curr.prev.next = curr.next
                curr.next.prev = curr.prev
                curr.prev = nil
                curr.next = nil
                @length -= 1
                break
            end
            curr = curr.next
        end
    end

    def cat list
        if @head == nil
            @head = list.head
            @tail = list.tail
        else
            list.head.prev = @tail
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

    def find_last &predicate
        return nil unless block_given?

        curr = @tail
        while curr
            return curr if predicate.call(curr)
            curr = curr.prev
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

    def reverse_each
        return nil unless block_given?

        curr = @tail
        while curr
            yield curr
            curr = curr.prev
        end
    end

    def display rev=false
        return nil unless @length > 0

        if rev
            reverse_each {|item| puts item.data }
        else
            each {|item| puts item.data }
        end
    end
end