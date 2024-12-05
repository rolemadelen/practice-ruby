require 'test/unit'
require_relative 'stack.rb'

class SinglyLinkedListTest < Test::Unit::TestCase
    def test_initialize
        stk = Stack.new

        assert(stk.top == nil, "empty stack")
        assert(stk.size == 0, "empty stack")
    end

    def test_push
        stk = Stack.new

        stk.push 1
        assert(stk.peek == 1, "top of the stack")
        assert(stk.size == 1, "size of the stack")
        
        stk.push 3
        assert(stk.peek == 3, "top of the stack")
        assert(stk.size == 2, "size of the stack")
        
        stk.push 5
        assert(stk.peek == 5, "top of the stack")
        assert(stk.size == 3, "size of the stack")
        
        stk.push 7
        assert(stk.peek == 7, "top of the stack")
        assert(stk.size == 4, "size of the stack")
        
        stk.push 9
        assert(stk.peek == 9, "top of the stack")
        assert(stk.size == 5, "size of the stack")
    end

    def test_pop
        stk = Stack.new

        assert(stk.pop == nil, "empty stack")

        stk.push 1
        stk.push 2
        stk.push 3
        stk.push 4
        stk.push 5
        assert(stk.peek == 5, "top of the stack")

        stk.pop
        assert(stk.peek == 4, "top of the stack")

        stk.pop 
        assert(stk.peek == 3, "top of the stack")
        
        stk.pop         
        assert(stk.peek == 2, "top of the stack")
        
        stk.pop 
        assert(stk.peek == 1, "top of the stack")

        stk.pop 
        assert(stk.top == nil, "empty stack")
        assert(stk.size == 0, "empty stack")
    end

    def test_peek
        stk = Stack.new

        assert(stk.peek == nil, "empty stack")

        stk.push 1
        stk.push 2
        stk.push 3
        stk.push 4
        stk.push 5

        assert(stk.peek == 5, "top of the stack")
        
        stk.pop
        assert(stk.peek == 4, "top of the stack")

        stk.pop
        assert(stk.peek == 3, "top of the stack")

        stk.pop
        assert(stk.peek == 2, "top of the stack")

        stk.pop
        assert(stk.peek == 1, "top of the stack")

        stk.pop
        assert(stk.peek == nil, "empty stack")
    end

    def test_clear
        stk = Stack.new

        assert(stk.size == 0, "empty stack")

        stk.push 1
        stk.push 2
        stk.push 3
        stk.push 4

        assert(stk.size != 0, "the stack is not empty")

        stk.clear
        assert(stk.size == 0, "empty stack")
    end
end