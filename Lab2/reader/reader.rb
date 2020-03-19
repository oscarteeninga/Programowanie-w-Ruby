def reader(input)
    word = ""
    number = ""
    i = 0
    while i < input.length
        if input[i] =~ /[0-9]/
            number += input[i]
        else
            word += input[i]
        end
        i += 1
    end
    if word != ""
        #print "Word: ", word
    end
    if number != ""
        #print "Number: ", number
    end
    array = []
    array[0] = word
    array[1] = number                                                                                                                            
    return array
end