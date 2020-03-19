gem 'rdoc'
require 'rdoc/rdoc'

def get_line()
    input = $stdin.read(input())
    return input
end

def count_words(input)
    array = Array.new(input.size, 0)
    input = input.split(" ")
    for word in input
        array[word.size] += 1
    end
    return array
end

def print_result(array)   
    i = 0
    puts "Dlugosc napisu: krotnosc napisu"
    while i < array.size
        if array[i] != 0
            print i, "\t\t", array[i], "\n"
        end
        i += 1
    end 
end

input = <<EOF
oscar maciej
andrzej krzys
basia barbara
katarzyna misiek
pomidor 
EOF

def program(input)
    print input
    array = count_words(input)
    print_result(array)
end



def interactive_program()
    input = gets()
    array = count_words(input)
    print_result(array)
end

program(input.to_s)
