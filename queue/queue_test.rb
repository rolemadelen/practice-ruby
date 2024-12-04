require 'test/unit'
require_relative 'queue.rb'

class SinglyLinkedListTest < Test::Unit::TestCase
    def test_initialize
        q = Queue.new

        assert(q.head == nil, "empty list")
        assert(q.tail == nil, "empty list")
        assert(q.length == 0, "empty list")
    end

    def test_enqueue
        q = Queue.new

        q.enqueue 1
        assert(q.peek == 1, "1st item")
        assert(q.tail.data == 1, "recent item")
        assert(q.length == 1, "size of the queue")
        
        q.enqueue 3
        assert(q.peek == 1, "1st item")
        assert(q.tail.data == 3, "recent item")
        assert(q.length == 2, "size of the queue")
        
        q.enqueue 5
        assert(q.peek == 1, "1st item")
        assert(q.tail.data == 5, "recent item")
        assert(q.length == 3, "size of the queue")
        
        q.enqueue 7
        assert(q.peek == 1, "1st item")
        assert(q.tail.data == 7, "recent item")
        assert(q.length == 4, "size of the queue")
        
        q.enqueue 9
        assert(q.peek == 1, "1st item")
        assert(q.tail.data == 9, "recent item")
        assert(q.length == 5, "size of the queue")
    end

    def test_dequeue
        q = Queue.new

        assert(q.dequeue == nil, "empty list")

        q.enqueue 1
        q.enqueue 2
        q.enqueue 3
        q.enqueue 4
        q.enqueue 5
        assert(q.peek == 1, "1st item")

        q.dequeue 
        assert(q.peek == 2, "1st item")

        q.dequeue 
        assert(q.peek == 3, "1st item")
        
        q.dequeue         
        assert(q.peek == 4, "1st item")
        
        q.dequeue 
        assert(q.peek == 5, "1st item")

        q.dequeue 
        assert(q.head == nil, "empty list")
        assert(q.length == 0, "empty list")
    end

    def test_peek
        q = Queue.new

        assert(q.peek == nil, "empty list")

        q.enqueue 1
        q.enqueue 2
        q.enqueue 3
        q.enqueue 4
        q.enqueue 5

        assert(q.peek == 1, "1st item")
        
        q.dequeue
        assert(q.peek == 2, "1st item")

        q.dequeue
        assert(q.peek == 3, "1st item")

        q.dequeue
        assert(q.peek == 4, "1st item")

        q.dequeue
        assert(q.peek == 5, "1st item")

        q.dequeue
        assert(q.peek == nil, "empty list")
    end

    def test_clear
        q = Queue.new

        assert(q.length == 0, "empty list")

        q.enqueue 1
        q.enqueue 2
        q.enqueue 3
        q.enqueue 4

        assert(q.length != 0, "the list is not empty")

        q.clear
        assert(q.length == 0, "empty list")
    end
end