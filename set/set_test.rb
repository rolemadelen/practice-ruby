require 'test/unit'
require_relative 'set.rb'

class SetTest < Test::Unit::TestCase
    def test_initialize
        set = Set.new
        assert(set.count == 0, "empty set")
    end

    def test_insert_and_remove
        set = Set.new
        set.insert 1
        set.insert 3
        set.insert 5

        assert(set.contains?(1), "set {1, 3, 5}")
        assert(set.contains?(3), "set {1, 3, 5}")
        assert(set.contains?(5), "set {1, 3, 5}")
        assert(set.contains?(7) == nil, "set {1, 3, 5}")
        assert(set.count == 3, "set {1,3,5}")
        
        set.remove 3
        assert(set.contains?(1), "set {1, 5}")
        assert(set.contains?(3) == nil, "set {1, 5}")
        assert(set.contains?(5), "set {1, 5}")
        assert(set.count == 2, "set {1,5}")
        
        set.remove 5
        assert(set.contains?(1), "set {1}")
        assert(set.contains?(3) == nil, "set {1}")
        assert(set.contains?(5) == nil, "set {1}")
        assert(set.count == 1, "set {1}")
        
        set.insert 7
        assert(set.contains?(1), "set {1, 7}")
        assert(set.contains?(7), "set {1, 7}")

        set.remove 1
        set.remove 7
        assert(set.count == 0, "empty set")

        set.remove 17
        assert(set.count == 0, "empty set")
    end

    def test_union 
        setA = Set.new()
        setB = Set.new()

        setA.insert 1
        setA.insert 3
        setA.insert 5

        setB.insert 2
        setB.insert 4
        setB.insert 6

        union_set = setA.union setB

        assert(union_set.count == 6, "set {1,3,5,2,4,6}")
        assert(union_set.contains?(1), "set {1,3,5,2,4,6}")
        assert(union_set.contains?(2), "set {1,3,5,2,4,6}")
        assert(union_set.contains?(3), "set {1,3,5,2,4,6}")
        assert(union_set.contains?(4), "set {1,3,5,2,4,6}")
        assert(union_set.contains?(5), "set {1,3,5,2,4,6}")
        assert(union_set.contains?(6), "set {1,3,5,2,4,6}")
        assert(union_set.contains?(7) == nil, "set {1,3,5,2,4,6}")

        setA = setA.union setA
        assert(setA.count == 3, "set {1,3,5}")
    end

    def test_intersection
        setA = Set.new()
        setB = Set.new()

        setA.insert 1
        setA.insert 2
        setA.insert 3

        setB.insert 2
        setB.insert 3
        setB.insert 5

        new_set = setA.intersect setB
        assert(new_set.count == 2, "set {2, 3}")
        assert(new_set.contains?(1) == nil, "set {2, 3}")
        assert(new_set.contains?(2), "set {2, 3}")
        assert(new_set.contains?(3), "set {2, 3}")
        assert(new_set.contains?(5) == nil, "set {2, 3}")

        setA = Set.new()
        setB = Set.new()

        setA.insert 1
        setA.insert 2
        setA.insert 3

        setB.insert 4
        setB.insert 5
        setB.insert 6

        new_set = setA.intersect setB
        assert(new_set.count == 0, "empty set")

        setA = setA.intersect setA
        assert(setA.count == 3, "set {1,2,3}")
        assert(setA.contains?(1), "set {1,2,3}")
        assert(setA.contains?(2), "set {1,2,3}")
        assert(setA.contains?(3), "set {1,2,3}")
    end

    def test_diff
        setA = Set.new
        setB = Set.new

        setA.insert 1
        setA.insert 2
        setA.insert 3
        
        setB.insert 2
        setB.insert 3
        setB.insert 4

        new_set = setA.diff setB

        assert(new_set.count == 1, "set {1}")
        assert(new_set.contains?(1), "set {1}")
        assert(new_set.contains?(4) == nil, "set {1}")

        setA = Set.new
        setB = Set.new

        setA.insert 1
        setA.insert 2
        setA.insert 3
        
        setA = setA.diff setA
        assert(setA.count == 0, "empty set")
    end

    def test_subset
        setA = Set.new
        setB = Set.new

        setA.insert 1
        setA.insert 2
        setA.insert 3
        setA.insert 4
        setA.insert 5

        setB.insert 2
        setB.insert 3
        setB.insert 4

        assert(setB.subset?(setA), "setB is a subset of setA")
        assert(setA.subset?(setB) == false, "setA is NOT a subset of setB")
        assert(setA.subset?(setA), "setA is a subset of set itself")
        assert(setB.subset?(setB), "setB is a subset of set itself")
    end

    def test_equal
        setA = Set.new
        setB = Set.new

        setA.insert 17
        setA.insert 170
        setA.insert 1700

        setB.insert 1700
        setB.insert 170
        setB.insert 17

        assert(setA.equal?(setA), "setA == setA")
        assert(setB.equal?(setB), "setB == setB")
        assert(setA.equal?(setB), "setA == setB")
    end
end