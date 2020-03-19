require "/Users/oscarteeninga/Dropbox/Informatyka IET/Semestr 4/Ruby/Lab3/objective.rb"

RSpec.describe Odbiorca do
    before(:each) { @odbiorca = Odbiorca.new([1,2,3]) }

    it "should return Array when we call the utworz_tablice method" do 
        hw = Odbiorca.new([1,2,3])
        array = hw.utworz_tablice(10, 10)
        expect(array.length).to eq 10
     end

    it "should place Array to Odbiorca when we call the utworz_tablice method" do 
        hw = Odbiorca.new([1,2,3])
        array = hw.utworz_tablice!(10, 10)
        expect(array.length).to eq 10
        expect(hw.tab).to eq array
     end

    it "shoukd return count of odd numbers in Array when we call the ilosc_liczb_parzystych method" do
        hw = Odbiorca.new((1..100).to_a)
        odd = hw.ilosc_liczb_parzystych()
        expect(odd).to eq 50
    end
end # RSpec.describe