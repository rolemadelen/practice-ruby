require 'test/unit'
require_relative 'hashtable.rb'

class HashTableTest < Test::Unit::TestCase
    def test_initialize
        ht = HashTable.new

        assert(ht.size == 0, "empty table")
    end
    
    def test_rebuilds
        ht = HashTable.new
        
        assert(ht.slots == 5, "0 rebuild max size")
        
        5.times do |i|
            ht[i] = i*2
        end

        assert(ht.slots == 13, "1 rebuild max size")
        
        5.upto(10) do |i|
            ht[i] = i*2
        end

        assert(ht.slots == 31, "2 rebuild max size")

        200.times do |i|
            ht[i] = i*2
        end

        assert(ht.slots == 509, "6 rebuild max size")
    end

    def test_get
        ht = HashTable.new
        
        assert(ht["name"] ==  nil, "key doesn't exist")

        1.upto(10) do |i|
            ht[i] = i*2
        end
        
        assert(ht.size == 10, "assert 10 keys inserted")
        assert(ht[1] == 2, "get key 1")
        assert(ht[10] == 20, "get key 10")
        assert(ht[12] == nil, "get key 12")
    end

    def test_delete
        ht = HashTable.new

        ht["name"] = "bob"

        assert(ht["name"] == "bob", "find 'name")

        ht.delete "name"
        assert(ht["name"] == nil, "key doesn't exist")
    end
end