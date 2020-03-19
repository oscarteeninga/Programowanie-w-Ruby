module Cw3
class Odbiorca
    @tab = [1,2,3]
    # @prints information about called method
    def self.to_s
      "Wywołano metodę klasową '%s()'" % __method__
    end

    # @prints information about called method
    def to_s
      "Wywołano metodę instancyjną '%s()'" % __method__
    end

    # @prints information about called method
    def self.inspect
      "Wywołano metodę klasową '%s()'" % __method__
    end
    
    # @prints information about called method
    def inspect
      "Wywołano metodę instancyjną '%s()'" % __method__
    end

    # @init a Odbiorca instance and place argument as #tab
    def initialize(table)
        @tab = table
    end

    # prints #tab  
    def komunikat
      puts @tab
    end

    # prints #tab
    def self.komunikat
      puts @tab
    end

    def tab
        @tab
    end

    # Create randomly filled array
    # @return [Array<Integer>, nil] the created array
    def utworz_tablice(n,m)
        array = Array.new(n)
        i = 0
        while i < n
            array[i] = rand(m - 1) + 1
            i += 1
        end
        return array
    end

    # Attribute generated array to #tab
    # @return [Array<Integer> nil] the attributed array
    def utworz_tablice!(n,m)
        @tab = self.utworz_tablice(n,m)
        return @tab
    end

    # Count odd numbers in #tab
    # @return [Integer] of odd numbers in @tab
    def ilosc_liczb_parzystych()
        array = @tab
        array.keep_if { |number| number.to_f % 2 == 0 }
        return array.length
    end
  end # class Odbiorca
end # module Cw3
include Cw3