l_str = ""
bib_str = ""

File.open("LaTeX").each_line { |line| l_str += line }
File.open("BibTex").each_line { |line| bib_str += line }

l_str_cpy = l_str
objects = []

i = 0
while (l_str =~ /cite{\w+}/)
    start =  (l_str =~ /cite{\w+}/)
    element = l_str[(start+5)..(l_str.length-1)]
    last = (element =~ /\}/)
    l_str = element
    element = element[0..(last-1)]
    objects[i] = element
    i += 1
end

categories = []

File.open("LaTeX") do |f|
    f.each_line do |line| 
        if (line =~ /%%\w*/) 
            helparray = line.split(" ")
            i = 1
            while i < helparray.length
                categories.push(helparray[i])
                i += 1
            end
        end
    end
end

puts categories

i = 0
flag = 0
map = {}

File.open("BibTeX") do |f|
    f.each_line do |line|
        if (flag == 1)
            helparray = line.split(" = ")
            if (helparray.length == 2)
                map[objects[i]][helparray[0].delete(" ")] = helparray[1] 
            end
        end
        if (line =~ /@ARTICLE{#{objects[i]},\n/)
            flag = 1
            map[objects[i]] = {}
        end
        if (line == "}\n" && flag == 1)
            flag = 0
            i += 1
        end
    end
end


puts "\\begin{thebibliography}{9}"

for key in map.keys
    puts "\t\\bibitem{" + key + "}"
    for elements in map[key].keys
        if (categories.include?(elements))
            puts "\t\t\\item{" + elements + "}"
            puts "\t\t" + map[key][elements]
        end
    end
end

puts "\\end{thebibliography}"