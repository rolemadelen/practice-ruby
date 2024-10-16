def q10809
    # Tue Oct 15, 2024 - 5:22PM
    loc = [-1]*26
    s = gets.chomp

    for i in 0...s.size do
        ch = s[i].ord
        if loc[ch-97] == -1
            loc[ch-97] = i 
        end
    end

    puts loc.join(" ")
end

def q2675
    # Tue Oct 15, 2024 - 5:27PM
    t = gets.to_i
    t.times do 
        r, s = gets.split
        r = r.to_i

        s.each_byte do |ch|
            print ch.chr*r
        end
        puts
    end
end

def q2908
    # Tue Oct 15, 2024 - 5:35PM ~ 5:37PM
    a,b = gets.split
    a = a.reverse.to_i
    b = b.reverse.to_i
    puts a > b ? a : b
end

def q5622
    # Tue Oct 15, 2024 - 5:41PM ~ 5:47PM
    key = "22233344455566677778889999"
    s = gets.chomp
    t = 0

    s.each_byte do |ch|
        ch = ch.ord
        t += (key[ch-65].to_i)+1
    end

    puts t
end

def q25083
    # Tue Oct 15, 2024 - 6:01PM
    puts "         ,r'\"7"
    puts "r`-_   ,'  ,/"
    puts " \\. \". L_r'"
    puts "   `~\\/"
    puts "      |"
    puts "      |"
end

def q10088
    # Tue Oct 15, 2024 - 6:02PM ~ 6:03PM
    s = gets.chomp
    puts s == s.reverse ? 1 : 0
end

def q10088_2
    # Tue Oct 15, 2024 - 6:02PM ~ 6:05PM
    s = gets.chomp
    a = 0
    b = s.size - 1

    while a < b do
        if s[a] != s[b]
            return 0
        end

        a += 1
        b -= 1
    end

    return 1
end

def q2444 
    # Tue Oct 15, 2024 - 6:17PM

    x = gets.to_i

    for i in 0...x do
        (x-i-1).times {print " "}
        (2*i+1).times {print "*"}
        puts
    end

    for i in 0...x do
        (i+1).times {print " "}
        (2*(x-i-1)-1).times {print "*"}
        puts
    end
end

def q1157
    # Tue Oct 15, 2024 - 6:18PM ~ 6:22PM
    s = gets.chomp.downcase
    freq = [0]*26

    s.each_byte do |c|
        freq[c.ord - 97] += 1
    end

    m = freq.max
    puts freq.select {|el| el == m}.size > 1 ? "?" : (freq.index(m)+97).chr.upcase
end

def q3003
    # Tue Oct 15, 2024 - 6:23PM
    p = gets.split.map(&:to_i)
    p[0] = 1 - p[0]
    p[1] = 1 - p[1]
    p[2] = 2 - p[2]
    p[3] = 2 - p[3]
    p[4] = 2 - p[4]
    p[5] = 8 - p[5]
    puts p.join(" ")
end