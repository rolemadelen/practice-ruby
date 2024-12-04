class CircularLinkedList 
    attr_accessor :head, :current, :length

    def initialize 
        @head = nil
        @length = 0
        @current = nil
    end

    def insert data 
        return insert_next(nil, data) if @length == 0
        return insert_next(@head, data) if @length == 1

        # find the last node
        @current = @head
        i = 1
        while i < @length
            move_next
            i += 1
        end

        # insert right after the last node
        return insert_next(@current, data)
    end

    def remove data
        return nil unless @length > 0
        last_node = get_last

        if @head.data == data 
            if @length == 1
                @head = nil
            else
                @head = @head.next
                last_node.next = @head
            end
        else
            @current = @head
            while @current.next != @head
                if @current.next.data == data
                    @current.next == @current.next.next
                    break
                end
                move_next
            end
        end

        @length -= 1
    end

    def get_last
        return nil unless @length > 0
        return @head if @length == 1

        i = 1
        @current = @head
        while i < @length
            move_next
            i += 1
        end

        @current
    end

    def clear
        while @length > 0
            remove @head.data
        end
    end

    def move_next
        @current = @current&.next
    end

    def full_scan
        return nil unless block_given?

        @current = @head
        loop do 
            yield @current
            break if move_next == @head
        end
    end

    def find_first &predicate
        return nil unless block_given?
        
        @current = @head
        loop do
            return @current if predicate.call(@current)
            move_next
            return nil if @current == @head
        end
    end

    def print
        if @length == 0
            puts "empty"
        else
            self.full_scan { |item| puts item.data }
        end
    end

    private
    class Node
        attr_accessor :data, :next

        def initialize(item)
            @data = item
            @next = nil
        end
    end

    def insert_next current_node, data
        new_node = Node.new data

        if current_node == nil
            @head = new_node
            @head.next = @head
        else
            new_node.next = current_node.next
            current_node.next = new_node
        end

        @length += 1
    end
end