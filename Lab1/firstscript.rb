print "Podaj napis: "
str = gets.to_s.upcase
print "Podaj przesunięcie: "
steps = gets.to_i
i = 0
newstr = ""
while i < str.length-1
    newstr[i] = ((str[i].ord - 65 + steps) % 26 + 65).chr
    if str[i] == " "
        newstr[i] = " "
    end
    i += 1
end
print str, " => ", newstr, "\n"
