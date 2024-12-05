class Stack 
    attr_accessor :top, :size

    def initialize 
        @top = nil
        @size = 0
    end

    def push data
        node = Node.new data 
        
        if @size == 0
            @top = node
        else
            node.next = @top
            @top = node
        end

        @size += 1
    end

    def pop
        return nil unless @size > 0

        if @size == 1
            @top = nil
        else
            @top = @top.next
        end

        @size -= 1
    end

    def peek
        return nil unless @size > 0
        @top.data
    end

    def clear
        until @size == 0 
            self.pop
        end
    end

    def each
        return nil unless block_given?

        curr = @top
        while curr
            yield curr
            curr = curr.next
        end
    end

    def print
        return nil unless @size > 0

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