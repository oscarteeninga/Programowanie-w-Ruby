require "/Users/oscarteeninga/Dropbox/Informatyka IET/Semestr 4/Ruby/Lab3/system.rb"

RSpec.describe Calculator do
    begin 
        it "should return sum when call the add(x,y) method" do 
            expect(Calculator.add(10, 12)).to eq 22
        end

        it "should return substraction when call the substract(x,y) method" do 
            expect(Calculator.substract(22, 10)).to eq 12
        end

        it "should return multiplication when call the multiplication(x,y) method" do
            expect(Calculator.multiplication(11, 2)).to eq 22
        end

        it "should return division when call the division(x,y) method" do
            expect(Calculator.multiplication(2, 2)).to eq 4
        end

        it "should return integerability of arguments when call check(x) method" do
            expect(Calculator.check("hello", 1)).to eq FALSE
        end
    rescue Exception => e
        puts "Occured unexpected error"
    end
end # RSpec.describe

RSpec.describe Converter do
    begin
        it "should reverse string when call reserve(str) method" do
            expect(Converter.reverse("Alamakota")).to eq "atokamalA"
        end

        it "should upcase string when call upcase(str) method" do
            expect(Converter.swapcase("Alamakota")).to eq "aLAMAKOTA"
        end

        it "should return convertability of argument when call check(str) method" do
            expect(Converter.check("123")).to eq FALSE
        end
    rescue Exception => e
        puts "Occured unespeted Error"
    end
end # RSpec.descrive

