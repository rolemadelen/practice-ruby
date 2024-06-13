require_relative 'node.rb'

class LinkedList 
    def initialize
        @head = nil
        @tail = nil
        @size = 0
    end

    def size
        return @size
    end

    def push_back(value)
        new_node = Node.new(value)
        
        if @head == nil
            @head = new_node
            @tail = new_node
            @head.next = @tail
        else
            @tail.next = new_node
            @tail = new_node
        end

        @size += 1
    end

    def push_front(value)
        new_node = Node.new(value)

        if @head == nil 
            @head = new_node
            @tail = new_node
            @head.next = @tail
        else
            new_node.next = @head
            @head = new_node
        end


        @size += 1
    end

    def pop_back
        if empty?
            return nil
        end

        curr = @head 

        while curr && curr.next != @tail
            curr = curr.next
        end

        data = curr.next.data
        curr.next = nil
        @tail = curr

        @size -= 1

        return data
    end

    def pop_front 
        if empty?
            return nil
        else
            data = @head.data
            curr = @head
            @head = @head.next

            curr.next = nil
            curr = nil

            @size -= 1
            return data
        end
    end

    def insert(index, value)
        if index == 0
            push_front(value)
        elsif index == @size
            push_back(value)
        else
            new_node = Node.new(value)
            curr = @head

            for i in 1..index-1
                curr = curr.next
            end

            new_node.next = curr.next
            curr.next = new_node
    
            @size += 1
        end
    end

    def value_at(index)
        if index >= @size
            return nil
        end

        curr = @head

        for i in 1..index
            curr = curr.next
        end

        return curr.data
    end

    def erase(index)
        if index == 0 
            pop_front
        elsif index == @size
            pop_back
        else
            curr = @head

            for i in 1..index-1
                curr = curr.next
            end

            del_node = curr.next
            curr.next = del_node.next
            
            del_node.next = nil
            del_node = nil

            @size -= 1
        end
    end

    def remove_value(value) 
        index = 0
        curr = @head

        while curr
            if curr.data == value
                break
            end

            curr = curr.next
            index += 1
        end

        erase(index)
    end

    def print 
        ret = ""

        curr = @head
        while curr.next
            ret += "#{curr.data} "
            curr = curr.next
        end

        ret += "#{curr.data}"

        return ret
    end

    def print_range(index)
        ret = ""

        curr = @head

        for i in 0...index
            curr = curr.next
        end

        while curr.next
            ret += "#{curr.data} "
            curr = curr.next
        end

        ret += "#{curr.data}"

        return ret
    end
    
    def reverse
        curr = @head
        _prev = nil
        _next = nil

        while curr != nil
            _next = curr.next
            curr.next = _prev
            _prev = curr
            curr = _next
        end

        @head = _prev
    end

    def front 
        if @head == nil
            return nil
        end
        
        @head.data
    end
    
    def back
        if @tail == nil
            return nil
        end
        
        @tail.data
    end

    def empty?
        @size == 0
    end
end