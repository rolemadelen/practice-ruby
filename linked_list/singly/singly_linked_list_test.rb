require 'test/unit'
require_relative 'singly_linked_list.rb'

class SinglyLinkedListTest < Test::Unit::TestCase
    def test_initialize
        list = SinglyLinkedList.new
        
        assert(list.head == nil, "Newly created list, head = nil")
        assert(list.tail == nil, "Newly created list, tail = nil")
        assert(list.length == 0, "Newly created list, size = 0")
    end

    def test_insert
        list = SinglyLinkedList.new

        list.insert(17)
        assert(list.length == 1, "insert a node (17)")
        assert(list.head.data == 17, "head node contains 17")
        assert(list.head.next == nil, "tail is empty")
        assert(list.tail == list.head, "tail is the head")
        
        list.insert(34)
        assert(list.length == 2, "insert 2nd node (34)")
        assert(list.head.data == 17, "head node contains 17")
        assert(list.head.next == list.tail, "head.next is tail")
        assert(list.tail.data == 34, "tail node contains 34")
    end

    # def test_remove
    # end

    # def test_cat
    #     list = SinglyLinkedList.new
    #     list.insert 1
    #     list.insert 2
    #     list.insert 3
    #     list.insert 4
    #     list.insert 5

    #     assert(list.length == 5, "list with 5 nodes")

    #     # list2 = SinglyLinkedList.new
    #     # list2.insert 6
    #     # list2.insert 7
    #     # list2.insert 8
    #     # list2.insert 9
    #     # list2.insert 10
    #     # assert(list2.length ==5, "list2 with 5 nodes")

    #     # list.cat list2

    #     # assert(list.length == 10, "concatenated list 1 and list 2")
    #     # assert(list.head.data == 1, "head node with 1")
    #     # assert(list.tail.data == 10, "tail node with 10")
    # end

    # def test_clear
    # end

    # def test_find_first
    # end

    # def test_print
    # end
end