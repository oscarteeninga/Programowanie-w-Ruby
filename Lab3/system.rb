class Calculator
    def self.check(x,y)
        return x.to_i.to_s == x.to_s && y.to_i.to_s == y.to_s
    end

    def self.add(x,y)
        if Calculator.check(x,y)
            x = Integer(x)
            y = Integer(y)
            return x + y
        else
            return nil
        end
    end

    def self.substract(x,y)
        if Calculator.check(x,y)
            x = Integer(x)
            y = Integer(y)
            return x - y
        else
            return nil
        end
    end

    def self.multiplication(x,y)
        if Calculator.check(x,y)
            x = Integer(x)
            y = Integer(y)
            return x * y
        else
            return nil
        end
    end

    def self.division(x,y)
        if Calculator.check(x,y)
            x = Integer(x)
            y = Integer(y)
            if (y == 0)
                return inf
            else
                return x / y
            end
        else
            return nil
        end
    end
end

class Converter
    def self.check(x)
        x = x.to_s
        x = x.split("")
        for i in x
            if !(i =~ /[A-Za-z]/)
                return FALSE
            end
        end
        return TRUE
    end

    def self.reverse(str)
        if self.check(str)
            return str.reverse
        end
    end

    def self.swapcase(str)
        if self.check(str)
            return str.swapcase
        end
    end
end

class Console
    def self.handling(args)
        i = 0
        while i < args.length
            case args[i]
            when '--add'
                puts Calculator.add(args[i=i+1], args[i=i+1])
            when '--substract'
                puts Calculator.substract(args[i=i+1], args[i=i+1])
            when '--multiplication'
                puts Calculator.multiplication(args[i=i+1], args[i=i+1])
            when '--division'
                puts Calculator.multiplication(args[i=i+1], args[i=i+1])
            when '--reverse'
                puts Converter.reverse(args[i=i+1])
            when '--swapcase'
                puts Converter.swapcase(args[i=i+1])
            else
                puts "Cannot find command/unhandled argument set"
            end
            i += 1
        end
    end
end

Console.handling(ARGV)
        