class WelcomesController < ApplicationController
    def index
        @int_val = 10
        @statement = "Oscar Teeninga"
        @array = ["Today", 1, 0.0001, "Hello"]
        @hash = {"elem1" => "Hello", 2 => 2, "elem3" => "Goodbye"}
        puts @int_val, @statement, @array, @hash
        console()
    end
end
