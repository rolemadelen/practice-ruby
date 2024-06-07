require 'test/unit'
require_relative 'main.rb'

class VectorTest < Test::Unit::TestCase
    def test_at
        tester = Vector.new

        assert(tester.at(0) == nil, "empty vector")

        tester.push_back(1)
        tester.push_back(2)
        tester.push_back(3)

        assert(tester.at(0) == 1, "at(0) == 1")
        assert(tester.at(1) == 2, "at(1) == 2")
        assert(tester.at(2) == 3, "at(2) == 3")

        assert(tester.at(10) == nil, "out of bounds")
    end

    def test_empty?
        tester = Vector.new
        assert(tester.empty? == true, "vector is empty")

        tester.push_back(1);
        assert(tester.empty? == false, "vector is not empty")
    end

    def test_front 
        tester = Vector.new
        assert(tester.front == nil, "empty array")
    end 

    def test_last 
        tester = Vector.new
    end

    def test_push_back
        tester = Vector.new

        for i in 0..10 
            tester.push_back(i);
            assert(tester.size == i + 1, "push_back #{i} FAILED")
        end

        assert(tester.last == 10, "last element check FAILED")
    end
    
    def test_push_front
        tester = Vector.new
    
        for i in 0..10 
            tester.push_front(i);
            assert(tester.size == i + 1, "push_front #{i} FAILED")
        end
    
        assert(tester.front == 10, "first element check FAILED")
    end

    def test_insert_at 
        tester = Vector.new
        tester.insert_at(0, 1)
        tester.insert_at(1, 10)

        assert(tester.front == 1, "insert_at 0")
        assert(tester.last == 10, "insert_at 1")

        tester.insert_at(1, 7)

        assert(tester.at(0) == 1, "at 0")
        assert(tester.at(1) == 7, "at 1")
        assert(tester.at(2) == 10, "at 2")
    end

    def test_pop_back 
        tester = Vector.new

        for i in 1..10
            tester.push_back(i)
        end

        for i in 10.downto(1)
            assert(tester.pop_back == i, "pop_back #{i}")
        end

        assert(tester.pop_back == nil, "pop_back empty")
        assert(tester.pop_back == nil, "pop_back empty")
        assert(tester.pop_back == nil, "pop_back empty")
    end
    
    def test_pop_front
        tester = Vector.new
    
        for i in 1..10
            tester.push_back(i)
        end
    
        for i in 1..10
            assert(tester.pop_front == i, "pop_front #{i}")
        end
    
        assert(tester.pop_front == nil, "pop_front empty")
        assert(tester.pop_front == nil, "pop_front empty")
        assert(tester.pop_front == nil, "pop_front empty")
    end

    def test_remove_at
        tester = Vector.new

        assert(tester.remove_at(0) == nil, "remove_at empty vector")

        for i in 0...10
            tester.push_back(i)
        end

        tester.remove_at(5)

        assert(tester.at(5) == 6, "remove_at 5")
        assert(tester.find(5) == -1, "find 5")
        
        tester.remove_at(0)
        tester.remove_at(0)
        
        assert(tester.find(0) == -1, "find 0")
        assert(tester.find(1) == -1, "find 1")
        assert(tester.at(0) == 2, "at 0")
        assert(tester.at(1) == 3, "at 1")
    end
    
    def test_remove_all
        tester = Vector.new
        
        tester.push_back(1)
        tester.push_back(1)
        tester.push_back(3)
        tester.push_back(1)
        tester.push_back(5)
        
        assert(tester.size == 5, "size 5")
        
        tester.remove_all(1)
        assert(tester.size == 2, "size 2")
        assert(tester.find(1) == -1, "find 1")
        assert(tester.at(0) == 3, "at 0")
        assert(tester.at(1) == 5, "at 1")
    end

    def test_find
        tester = Vector.new

        assert(tester.find(1) == -1, "find an element not in the vector")

        tester.push_back(1)
        tester.push_back(3)
        tester.push_back(5)

        assert(tester.find(1) == 0, "find 1")
        assert(tester.find(3) == 1, "find 3")
        assert(tester.find(5) == 2, "find 5")

        tester.remove_at(1)

        assert(tester.find(1) == 0, "find 1 after remove")
        assert(tester.find(3) == -1, "find 3 after remove")
        assert(tester.find(5) == 1, "find 5 after remove")
    end

    def test_clear
        tester = Vector.new
        
        for i in 0...10
            tester.push_back(i)
        end

        assert(tester.size == 10, "size 10")

        tester.clear

        assert(tester.size == 0, "size 0")
    end
end