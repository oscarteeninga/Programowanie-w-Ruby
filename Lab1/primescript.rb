def isprimal?(num)
    
    if num == 2
        return true
    elsif num <= 1 || num % 2 == 0
        return false
    end

    i = 3

    while i <= Math.sqrt(num) do
        if num % i == 0
            return false
        end
        i+=2
    end

    return true
end

def isintegerable?(str)
    begin
        tmp = Integer(str)
        return true
    rescue
        return false
    end
end

puts "Type:" 
while(line = gets())
    if !isintegerable?(line)
        puts "Ignored"
    elsif isprimal?(Integer(line.to_i))
        puts "Primal number!"
    else
        puts "Not primal :("
    end
    puts "Type: "
end



