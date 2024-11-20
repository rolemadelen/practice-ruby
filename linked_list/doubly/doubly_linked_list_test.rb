require 'test/unit'
require_relative 'doubly_linked_list.rb'

class DoublyLinkedListTest < Test::Unit::TestCase
    def test_initialize
        list = DoublyLinkedList.new
        
        assert(list.head == nil, "Newly created list, head = nil")
        assert(list.tail == nil, "Newly created list, tail = nil")
        assert(list.length == 0, "Newly created list, size = 0")
    end

    def test_insert
        list = DoublyLinkedList.new

        list.insert(17)
        assert(list.length == 1, "insert the first node (17)")
        assert(list.head.data == 17, "head node.data == 17")
        assert(list.tail.data == 17, "tail node.data == 17")
        assert(list.head.next == nil && list.tail.next == nil, "head and tail next is nil")
        assert(list.head.prev == nil && list.tail.prev == nil, "head and tail prev is nil")
        assert(list.tail.prev == list.head.next, "tail.prev == head.next")
        assert(list.head.prev == nil && list.tail.next == nil, "head.prev and tail.next is nil")
        
        list.insert(34)
        assert(list.length == 2, "insert the second node (34)")
        assert(list.head.data == 17, "head is still the same")
        assert(list.head.next == list.tail, "head.next is tail")
        assert(list.tail.data == 34, "tail node contains 34")
        assert(list.tail.next == nil, "tail.next is nil")
        assert(list.head != list.tail, "the head and the tail is now different")

        list.insert(51)
        assert(list.length == 3, "insert the 3rd node")
        assert(list.head.data == 17, "3rd node's data is 51")
        assert(list.head.next.data == 34, "2nd node's data is 34")
        assert(list.head.next.next.data == 51, "3rd node's data is 51")
        assert(list.tail.data == 51, "tail data is 51")

        assert(list.head.next.data == 34, "2nd node")
        assert(list.head.next.prev.data == 17, "1st node")
        assert(list.head.next.next.data == 51, "3rd node")
        assert(list.head.next.next.prev.data == 34, "2nd node")
        assert(list.head.next.next.prev.prev.data == 17, "1st node")
        assert(list.head.next.next.prev.prev.next.data == 34, "2nd node")
        assert(list.head.next.next.prev.prev.next.next.data == 51, "3rd node")
    end

    def test_pop_back
        list = DoublyLinkedList.new
        assert(list.pop_back == nil, "empty list")

        list.insert 1
        list.insert 3
        list.insert 5
        list.insert 7
        list.insert 9

        assert(list.pop_back == 9, "remove the last node")
        assert(list.pop_back == 7, "remove the last node")
        assert(list.pop_back == 5, "remove the last node")
        assert(list.pop_back == 3, "remove the last node")
        assert(list.pop_back == 1, "remove the last node")
        assert(list.pop_back == nil, "empty list")
        assert(list.head == nil && list.tail == nil, "empty list")

        list.insert 1
        assert(list.pop_back == 1, "remove the last node")
        assert(list.pop_back == nil, "empty list")

        list.insert 1
        list.insert 2
        assert(list.head.data == 1, "head node")
        assert(list.tail.data == 2, "tail node")
        assert(list.pop_back == 2, "remove the last node")
        assert(list.pop_back == 1, "remove the last node")
    end

    def pop_front
        list = DoublyLinkedList.new
        assert(list.pop_front == nil, "empty list")

        list.insert 1
        list.insert 3
        list.insert 5
        list.insert 7
        list.insert 9

        assert(list.pop_front == 1 && list.length == 4, "remove first node")
        assert(list.pop_front == 3 && list.length == 3, "remove first node")
        assert(list.pop_front == 5 && list.length == 2, "remove first node")
        assert(list.pop_front == 7 && list.length == 1, "remove first node")
        assert(list.pop_front == 9 && list.length == 0, "remove first node")

        assert(list.head == nil && list.tail == nil, "empty list")
    end

    def test_remove
        list = DoublyLinkedList.new

        list.insert 1
        list.insert 3
        list.insert 5
        
        assert(list.head.data == 1, "head node")
        assert(list.head.next.data == 3, "middle node")
        assert(list.head.next.next.data == 5, "tail node")
        assert(list.tail.data == 5, "tail node")
        
        list.remove 3
        assert(list.head.data == 1, "head node")
        assert(list.head.next.data == 5, "middle node")
        assert(list.tail.data == 5, "tail node")
        
        list.remove 1
        assert(list.head.data == 5, "head node")
        assert(list.tail.data == 5, "tail node")
        assert(list.head.next == nil && list.tail.next == nil, "tail node")

        list.insert 10
        list.insert 20
        list.insert 30
        list.insert 40
        list.insert 50

        assert(list.length == 6, "five nodes")
        list.remove(30)
        assert(list.head.data == 5, "1st node")
        assert(list.head.next.data == 10, "2nd node")
        assert(list.head.next.next.data == 20, "3rd node")
        assert(list.head.next.next.next.data == 40, "4th node")
        assert(list.head.next.next.next.next.data == 50, "5th node")

        list.clear
        list.insert 1
        list.insert 1
        list.insert 1
        list.insert 1

        assert(list.length == 4, "list length")
        list.remove 1
        list.remove 1
        list.remove 1
        list.remove 1
        assert(list.remove(1) == nil, "empty list")
    end

    def test_cat
        list = DoublyLinkedList.new
        list.insert 1
        list.insert 2

        assert(list.length == 2, "list with 5 nodes")

        list2 = DoublyLinkedList.new
        list2.insert 3
        list2.insert 4
        list2.insert 5
        assert(list2.length == 3, "list2 with 5 nodes")

        list.cat list2

        assert(list.length == 5, "concatenated list 1 and list 2")
        assert(list.head.data == 1, "head node with 1")
        assert(list.tail.data == 5, "tail node with 10")

        assert(list.head.data == 1, "1st node")
        assert(list.head.next.data == 2, "2nd node")
        assert(list.head.next.next.data == 3, "3rd node")
        assert(list.head.next.next.next.data == 4, "4th node")
        assert(list.head.next.next.next.next.data == 5, "5th node")

        assert(list.tail.data == 5, "5th node")
        assert(list.tail.prev.data == 4, "4th node")
        assert(list.tail.prev.prev.data == 3, "3rd node")
        assert(list.tail.prev.prev.prev.data == 2, "2nd node")
        assert(list.tail.prev.prev.prev.prev.data == 1, "1st node")
    end

    def test_clear
        list = DoublyLinkedList.new
        list.insert 1
        list.insert 2
        list.insert 3
        list.insert 4
        list.insert 5
        list.insert 6
        list.insert 7
        list.insert 8
        list.insert 9

        assert(list.length == 9, "list with 9 elements")

        list.clear

        assert(list.length == 0, "clear list")
    end

    def test_find_first
        list = DoublyLinkedList.new

        list.insert 1
        list.insert 3
        list.insert 9
        list.insert 5
        list.insert 6
        list.insert 7
        list.insert 8
        list.insert 9

        e = list.find_first { |item| item.data % 2 == 0 }
        assert(e.data == 6, "first even number")
        
        e = list.find_first { |item| item.data == 9 }
        assert(e != list.tail, "find the first 9 node")

        e = list.find_first { |item| item == list.head }
        assert(e.data == list.head.data, "find the head noxde")

        e = list.find_first {|item| item == 99 }
        assert(e == nil, "no data found")
    end

    def test_find_last
        list = DoublyLinkedList.new

        list.insert 1
        list.insert 3
        list.insert 9
        list.insert 5
        list.insert 6
        list.insert 7
        list.insert 8
        list.insert 9

        e = list.find_last { |item| item.data % 2 == 0 }
        assert(e.data == 8, "first even number")
        
        e = list.find_last { |item| item.data == 9 }
        assert(e == list.tail, "find the last node")

        e = list.find_last {|item| item == 99 }
        assert(e == nil, "no data found")
    end
end