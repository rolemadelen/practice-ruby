require 'test/unit'
require_relative 'linked_list.rb'

class LinkedListTest < Test::Unit::TestCase
    def test_size
        tester = LinkedList.new
        
        assert(tester.size == 0, "list is empty")

        tester.push_back(1)
        tester.push_back(2)
        tester.push_back(3)

        assert(tester.size == 3, "list with 3 nodes")

        tester.pop_back
        assert(tester.size == 2, "list with 2 nodes")
    end

    def test_empty?
        tester = LinkedList.new

        assert(tester.empty? == true, "list is empty")

        tester.push_front(1)

        assert(tester.empty? == false, "list contains a node")
    end
    
    def test_push_front
        tester = LinkedList.new

        tester.push_front(1)
        assert(tester.front == 1, "front node(1)")
        assert(tester.back == 1, "last node(1)")

        tester.push_front(2)
        assert(tester.front == 2, "front node(2)")
        
        tester.push_front(17)
        assert(tester.front == 17, "front node(17)")
        
        tester.push_front(34)
        assert(tester.front == 34, "front node(34)")
        assert(tester.back == 1, "last node(34)")
    end

    def test_push_back
        tester = LinkedList.new

        tester.push_back(1)
        assert(tester.back == 1, "last node(1)")
        assert(tester.front == 1, "front node(1)")

        tester.push_back(2)
        assert(tester.back == 2, "last node(2)")
        
        tester.push_back(17)
        assert(tester.back == 17, "last node(17)")
        
        tester.push_back(34)
        assert(tester.back == 34, "last node(34)")
        assert(tester.front == 1, "first node(34)")
    end

    def test_pop_front
        tester = LinkedList.new

        tester.push_back(1)
        tester.push_back(2)
        tester.push_back(3)

        assert(tester.front == 1, "front node(1)")
        assert(tester.pop_front == 1, "removed front node(1)")
        
        assert(tester.front == 2, "new front node(2)")
        assert(tester.pop_front == 2, "removed front node(2)")
        
        assert(tester.front == 3, "new front node(3)")
        assert(tester.pop_front == 3, "removed front node(3)")

        assert(tester.pop_front == nil, "remove from the empty list")
    end
    
    def test_pop_back
        tester = LinkedList.new

        tester.push_back(1)
        tester.push_back(2)
        tester.push_back(3)

        assert(tester.back == 3, "front node(1)")
        assert(tester.pop_back == 3, "removed back node(3)")
        
        assert(tester.back == 2, "new back node(2)")
        assert(tester.pop_back == 2, "removed back node(2)")
        
        assert(tester.back == 1, "new back node(3)")
        assert(tester.pop_front == 1, "removed back node(3)")

        assert(tester.pop_back == nil, "remove from the empty list")
    end

    def test_value_at
        tester = LinkedList.new

        tester.push_back(1)
        tester.push_back(2)
        tester.push_back(3)

        assert(tester.value_at(0) == 1, "first node's data")
        assert(tester.value_at(1) == 2, "first node's data")
        assert(tester.value_at(2) == 3, "first node's data")
        assert(tester.value_at(10) == nil, "invalid index")
    end

    def test_front 
        tester = LinkedList.new
        tester.push_front(1)
        assert(tester.front == 1, "front node(1)")
        
        tester.push_front(2)
        assert(tester.front == 2, "front node(2)")

        tester.push_front(3)
        tester.push_front(17)
        assert(tester.front == 17, "front node(17)")

        tester.pop_front()
        tester.pop_front()
        tester.pop_front()
        assert(tester.front == 1, "front node(1)")
    end

    def test_back 
        tester = LinkedList.new

        tester.push_back(1)
        assert(tester.back == 1, "last node(1)")
        
        tester.push_back(2)
        assert(tester.back == 2, "last node(2)")

        tester.push_back(3)
        tester.push_back(17)
        assert(tester.back == 17, "last node(17)")

        tester.pop_back()
        tester.pop_back()
        tester.pop_back()
        assert(tester.back == 1, "last node(1)")
    end

    def test_insert
        tester = LinkedList.new

        tester.insert(0, 5)
        assert(tester.front == 5, "first node inserted")
        assert(tester.back == 5, "first node inserted")

        tester.push_back(10)
        tester.push_back(15)
        assert(tester.back == 15, "last node(15)")

        tester.insert(2, 17)
        assert(tester.value_at(2) == 17, "value at the 3rd node")

        tester.insert(1, 7)
        assert(tester.value_at(1) == 7, "value at the 2nd node")
    end

    def test_erase
        tester = LinkedList.new

        tester.push_back(1)
        tester.push_back(2)
        tester.push_back(3)
        tester.push_back(4)
        tester.push_back(5)

        tester.erase(2)
        assert(tester.size == 4, "the size of a list after removing a node")
        assert(tester.print == "1 2 4 5", "a node(3) is removed")

        tester.erase(0)
        tester.erase(2)
        assert(tester.size == 2, "the size of a list after removing 2 nodes")
        assert(tester.print == "2 4", "two nodes(1, 5) removed")
    end

    def test_print_range
        tester = LinkedList.new
        tester.push_back(1)
        tester.push_back(2)
        tester.push_back(3)
        tester.push_back(4)
        tester.push_back(5)

        assert(tester.print_range(0) == "1 2 3 4 5", "print all 5 nodes")
        assert(tester.print_range(2) == "3 4 5", "print all nodes starting from the 3rd node")
        assert(tester.print_range(4) == "5", "print the last node")
    end

    def test_reverse
        tester = LinkedList.new

        tester.push_back(1)
        tester.push_back(2)
        tester.push_back(3)
        tester.push_back(4)
        tester.push_back(5)

        assert(tester.print == "1 2 3 4 5", "before reversing #1")
        tester.reverse
        assert(tester.print == "5 4 3 2 1", "after reversing #1")
        
        tester.erae(2)
        assert(tester.print == "1 2 4 5", "before reversing #2")
        tester.reverse
        assert(tester.print == "5 4 2 1", "after reversing #2")
    end

    # def test_remove_value
    #     tester = LinkedList.new

    #     tester.push_back(1)
    #     tester.push_back(3)
    #     tester.push_back(5)
    #     tester.push_back(1)

    #     assert(tester.print == "1 3 5 1", "before removing a value 1")
    #     tester.remove_value(1)
    #     assert(tester.print == "3 5 1", "first node with a value 1 is removed")

    #     tester.remove_value(1)
    #     assert(tester.print == "3 5", "second node with a value 1 is removed")
    # end
end