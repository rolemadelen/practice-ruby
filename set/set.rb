require_relative "linked_list.rb"

class Set 
    def initialize 
        @list = LinkedList.new
    end

    def insert member
        return if contains? member
        @list.insert member
    end

    def remove member
        node = @list.find_first { |nd| nd.data == member }
        @list.remove node if node
    end

    def union other
        res = Set.new
        @list.each { |nd| res.insert(nd.data) }
        other.each { |nd| res.insert(nd.data) }
        res
    end

    def intersect other
        res = Set.new
        @list.each do |nd|
            res.insert(nd.data) if other.contains? nd.data
        end
        res
    end

    def diff other
        res = Set.new
        @list.each do |nd|
            res.insert(nd.data) unless other.contains? nd.data
        end
        res
    end

    def contains? member
        @list.find_first { |nd| nd.data == member }
    end

    def subset? other
        return false if self.count > other.count

        @list.each do |nd|
            return false unless other.contains?(nd.data)
        end

        true
    end

    def equal? other
        return false if self.count != other.count
        subset? other
    end

    def count
        @list.length
    end

    def each 
        return nil unless block_given?

        curr = @list.head
        while curr
            yield curr
            curr = curr.next
        end
    end

    def print 
        @list.display
    end
end