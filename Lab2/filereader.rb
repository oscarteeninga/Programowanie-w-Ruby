def print_in_lines(filename)
    f = File.new(filename, "r")
    line = f.read
    line = line.delete(",")
    line = line.split(" ")

    i = 0
    while i < line.length
        puts line[i]
        i += 1
    end
end

print_in_lines(ARGV[0])


