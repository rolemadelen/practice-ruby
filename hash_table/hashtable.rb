class HashTable
    class Slot
        attr_accessor :key, :value, :vacated
        
        def initialize key, value, vacated=false
            self.key     = key
            self.value   = value
            self.vacated = vacated
        end
        
        def free 
            self.value = nil
            self.vacated = true
        end
    end
    
    PRIMES = [13, 31, 61, 127, 251, 509]
    MAX_REBUILDS = 6 # Utmost equal to PRIMES.count

    attr_accessor :size, :slots

    def initialize
        self.slots = 5
        self.size  = 0
        @rebuilds  = 0
        @h1        = -> (k) { k % self.slots }
        @h2        = -> (k) { 1 + (k % (self.slots - 1)) }
        fill_table self.slots
    end

    # idiomatic way to get an entry
    def [](key)
        get(key)
    end

    def []=(key, value)
        upsert(key, value)
    end

    def delete key
        find_slot(key)&.free
    end

    def print
        i = 1
        @table.each do |e|
            if e 
                puts "#{i} -> #{e.key}: #{e.value}"
            else
                puts "#{i}. empty"
            end
            i += 1
        end
    end
    
private

    def get key
        find_slot(key)&.value
    end

    def double_hash hashcode, idx
        h1 = @h1.call(hashcode)
        h2 = @h2.call(hashcode)
        ((h1 + (idx * h2)) % self.slots).abs()
    end

    def fill_table slots
        @table = [nil] * slots
    end

    def rebuild
        raise "Too many entries." if @rebuilds >= MAX_REBUILDS

        old        = @table
        self.slots = PRIMES[@rebuilds]
        self.size  = 0
        fill_table self.slots
        old.each do |e|
            upsert e.key, e.value if e
        end
        @rebuilds += 1
    end
   
    def upsert key, value
        rebuild if self.size > (self.slots / 2)

        if (slot = find_slot(key))
            slot.value = value
            return
        end

        0.upto(self.slots - 1) do |i|
            index = double_hash key.hash, i
            slot  = @table[index]
            if slot.nil? || slot.vacated
                @table[index] = Slot.new key, value
                self.size += 1
                return
            end
        end
        raise "Weak hash function"
    end

    def find_slot key
        0.upto(self.slots - 1) do |i|
            index = double_hash key.hash, i 
            slot  = @table[index]
            return nil if slot.nil? || slot.vacated
            return slot if slot.key == key
        end
        nil
    end
end