class Vector
    def initialize()
        @size = 0
        @growth_factor = 2
        @shrink_factor = 4
        @vec = []
    end

    def at(index) 
        if index >= @size || index < 0
            return nil
        end

        @vec[index]
    end

    def empty?
        @size == 0
    end

    def front
        if @size == 0 
            return nil
        end

        @vec[0]
    end

    def last
        if @size == 0 
            return nil
        end

        @vec[@size - 1]
    end

    def push_back(item)
        @vec[@size] = item;
        @size += 1
    end

    def push_front(item)
        for i in (@size).downto(0)
            @vec[i] = @vec[i-1]
        end
        @vec[0] = item
        @size += 1
    end

    def insert_at(index, item)
        if index == @size 
            push_back(item)
        elsif index == 0
            push_front(item)
        else
            for i in (@size).downto(index)
                @vec[i] = @vec[i-1]
            end
            @vec[index] = item
            @size += 1
        end
    end

    def pop_back
        if @size == 0
            return nil
        end

        @size -= 1
        item = @vec[@size]
        @vec[@size] = nil
        item
    end

    def pop_front
        if @size == 0
            return nil
        end

        item = @vec[0]

        for i in 0..@size-1
            @vec[i] = @vec[i + 1]
        end
        @size -= 1
        @vec[@size] = nil

        item
    end

    def remove_at(index)
        if index >= @size || index < 0
            return nil
        end

        for i in index..@size-1
            @vec[i] = @vec[i + 1]
        end
        @size -= 1
        @vec[@size] = nil
    end

    def remove_all(item)
        while true
            index = find(item)
            if index == -1
                break
            end

            remove_at(index)
        end
    end

    def find(item)
        for i in 0...@size
            if @vec[i] == item 
                return i
            end
        end

        return -1
    end

    def clear
        @vec = []
        @size = 0
    end

    attr_reader :size, :vec
end