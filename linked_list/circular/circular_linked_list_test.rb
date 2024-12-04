require 'test/unit'
require_relative 'circular_linked_list.rb'

class CircularLinkedListTest < Test::Unit::TestCase
    def test_initialize
        list = CircularLinkedList.new
        
        assert(list.head == nil, "Newly created list, head = nil")
        assert(list.length == 0, "Newly created list, size = 0")
    end

    def test_insert
        list = CircularLinkedList.new

        list.insert 1
        assert(list.head.data == 1, "1st node")
        assert(list.head.next. data == 1, "1st node")
        assert(list.length == 1, "list size == 1")
        
        list.insert 2
        list.insert 3
        assert(list.length == 3, "list size == 3")

        assert(list.head.data == 1, "1st node")
        assert(list.head.next.data == 2, "2nd node")
        assert(list.head.next.next.data == 3, "3rd node")
        assert(list.head.next.next.next.data == 1, "back to 1st node")
        assert(list.head.next.next.next.next.data == 2, "back to 2nd node")
        assert(list.head.next.next.next.next.next.data == 3, "back to 3rd node")
    end

    def test_remove
        list = CircularLinkedList.new
        
        list.insert 1
        list.insert 3
        list.insert 5

        assert(list.head.data == 1, "head node (1)")

        list.remove 1
        assert(list.length == 2, "list size = 2")
        assert(list.head.data == 3, "new head = 3")
        
        list.remove 5
        assert(list.length == 1, "list size = 1")
        assert(list.head.data == 3, "new head = 3")

        list.remove 3
        assert(list.length == 0, "list size = 0")
        assert(list.head == nil, "empty list")

        list.remove 7
        assert(list.length == 0, "empty list")
        assert(list.head == nil, "empty list")

        assert(list.remove(8) == nil, "empty list")
    end

    def test_get_last
        list = CircularLinkedList.new

        list.insert 1
        assert(list.get_last.data == 1, "last node 1")
        list.insert 2
        assert(list.get_last.data == 2, "last node 2")
        list.insert 3
        assert(list.get_last.data == 3, "last node 3")
        list.insert 4
        assert(list.get_last.data == 4, "last node 4")
        list.insert 5
        assert(list.get_last.data == 5, "last node 5")
        
        list.remove 5
        assert(list.get_last.data == 4, "last node 4")
        list.remove 4
        assert(list.get_last.data == 3, "last node 3")
        list.remove 3
        assert(list.get_last.data == 2, "last node 2")
        list.remove 2
        assert(list.get_last.data == 1, "last node 1")

        assert(list.head.data == 1, "head node = 1")
        assert(list.length == 1, "list contains 1 node")

        list.remove 1
        assert(list.get_last == nil, "empty list")
        assert(list.length == 0, "empty list")
    end

    def test_clear
        list = CircularLinkedList.new

        list.clear
        assert(list.length == 0, "empty list")

        list.insert 1
        list.insert 2
        list.insert 3
        list.insert 4
        list.insert 5
        list.insert 6
        list.insert 7

        assert(list.length == 7, "list contain 7 nodes")
        assert(list.head.data == 1, "list head = 1")
        assert(list.get_last.data == 7, "last node = 7")

        list.clear
        assert(list.length == 0, "empty list")
        assert(list.head == nil, "empty list")
    end

    def test_find_first
        list = CircularLinkedList.new

        list.insert 1
        list.insert 3
        list.insert 5
        list.insert 7
        list.insert 17
        list.insert 100

        e = list.find_first {|node| node.data > 10 }
        assert(e.data == 17, "first node that contains a value > 10")

        e = list.find_first {|node| node.data > 50 }
        assert(e.data == 100, "first node that contains a value > 50")

        e = list.find_first {|node| node.data % 2 == 0 }
        assert(e.data == 100, "first node that contains an even value")

        e = list.find_first {|node| node.data % 2 != 0 }
        assert(e.data == 1, "first node that contains an odd value")

        e = list.find_first { |node| node.data == 18 }
        assert(e == nil, "there's no node that contain's a value 18")
    end
end