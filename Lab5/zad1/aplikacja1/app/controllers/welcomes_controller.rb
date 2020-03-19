class WelcomesController < ApplicationController
    def index
        @ilosc = 10
        @komunikat = "Oscar Teeninga"
        @tablica = ["Today", 1, 0.0001, "Hello"]
        @hash = {"elem1" => "Hello", 2 => 2, "elem3" => "Goodbye"}
        puts @ilosc, @komunikat, @tablica, @hash
        #raise("Błąd")
    end
end
