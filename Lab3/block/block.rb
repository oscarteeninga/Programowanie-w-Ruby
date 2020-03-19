array = Array.new(0) 
ARGV.map { |file_name| File.open(file_name).each_line {|line|  array.push(line)}.map { |line| line.class == String } }
big_array = Array.new(0)
array.each { |line| line.delete("\n")}
array.each { |line| line.split(" ").each { |number| big_array.push(number)}}
big_array.keep_if { |number| number.to_f % 2 == 0 }
puts big_array.length
sum = 0

