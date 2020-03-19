# Nazwa gema: 'SalesSystem'
require "/Users/oscarteeninga/Dropbox/Informatyka IET/Semestr 4/Ruby/Lab3/gemzaaw/SalesSystem/lib/SalesSystem.rb"

include Clients
include Products
include Categories
include Crud

RSpec.describe Clients::Client  do
  before(:all) do
    # Inicjalizacja clientów
    @client1 = Clients::Client.new('Joanna', 'Kowalska')
    @client2 = Clients::Client.new('Jerzy', 'Nowak')
    # Inicjalizacja kategorii
    @food = Categories::Alcohol.new("Food", 23)
    @alcohol = Categories::Alcohol.new("Alcohol", 64)
    @cosmetics = Categories::Cosmetics.new("Cosmetics", 8)
    # Inicjalizacja produktów
    @bread = Products::Product.new("Bread", @food, 2)
    @ham = Products::Product.new("Ham", @food, 5)
    @vodka = Products::Product.new("Vodka", @alcohol, 15)
    @beer = Products::Product.new("Heineken", @alcohol, 5)
    @lipstick = Products::Product.new("Kylie", @cosmetics, 25)
    @eyeliner = Products::Product.new("CHANNEL", @cosmetics, 15)
    @products1 = [@bread, @ham, @bread, @ham, @lipstick, @eyeliner]
    @products2 = [@vodka, @beer]
    # Uzupełnienie koszyków clientów
    @client1.add_product(@bread)
    @client1.add_product(@ham)
    @client1.add_product(@bread)
    @client1.add_product(@ham)
    @client1.add_product(@lipstick)
    @client1.add_product(@eyeliner)
    @client2.add_product(@vodka)
    @client2.add_product(@beer)
    ######################
  end

  it 'category vat' do
    expect(@food.vat).to eq(23)
    expect(@alcohol.vat).to eq(64)
    expect(@cosmetics.vat).to eq(8)
  end

  it 'product price' do
    expect(@vodka.price).to eq(@vodka.netto*(100 + @alcohol.vat)/100)
    expect(@beer.price).to eq(@beer.netto*(100 + @alcohol.vat)/100)
    expect(@eyeliner.price).to eq(@eyeliner.netto*(100 + @cosmetics.vat)/100)
  end

  it 'has name' do
    expect(@client1.first_name).to eq('Joanna')
    expect(@client1.last_name).to eq('Kowalska')
  end
 
  it 'has unique id' do
    expect(@client1.id).not_to eq @client2.id
  end
 
  it 'has unmodifiable id' do
    expect { @client.id = 1 }.to raise_error NoMethodError
  end
 
  it 'can displays full information' do
    expect { puts @client1 }.to output("Joanna Kowalska\n\nRabat=10%\n\nBread\nHam\nBread\nHam\nKylie\nCHANNEL\n\nSuma=53\n").to_stdout
    expect { puts @client2 }.to output("Jerzy Nowak\n\nRabat=0%\n\nVodka\nHeineken\n\nSuma=32\n").to_stdout
  end
 
  it 'can modify personal data' do
    @client1.first_name = 'Joanna Urszula'
    @client1.last_name = 'Nowak'
    expect(@client1.first_name).to eq 'Joanna Urszula'
    expect(@client1.last_name).to eq 'Nowak'
  end
 
  it 'properly stores products' do
    expect(@client1.products).to match_array(@products1)
    expect(@client2.products).to match_array(@products2)
  end
 
  it 'has a discount when he bought, at least, 5 products' do
    expect(@client1.has_discount?).to be_truthy
    expect(@client2.has_discount?).to be_falsy
  end
end

RSpec.describe Categories::Category, Products::Product  do
  before(:all) do
    # Inicjalizacja clientów
    @client1 = Clients::Client.new('Joanna', 'Kowalska')
    @client2 = Clients::Client.new('Jerzy', 'Nowak')
    # Inicjalizacja kategorii
    @food = Categories::Alcohol.new("Food", 23)
    @alcohol = Categories::Alcohol.new("Alcohol", 64)
    @cosmetics = Categories::Cosmetics.new("Cosmetics", 8)
    # Inicjalizacja produktów
    @bread = Products::Product.new("Bread", @food, 2)
    @ham = Products::Product.new("Ham", @food, 5)
    @vodka = Products::Product.new("Vodka", @alcohol, 15)
    @beer = Products::Product.new("Heineken", @alcohol, 5)
    @lipstick = Products::Product.new("Kylie", @cosmetics, 25)
    @eyeliner = Products::Product.new("CHANNEL", @cosmetics, 15)
  end

  it 'category vat' do
    expect(@food.vat).to eq(23)
    expect(@alcohol.vat).to eq(64)
    expect(@cosmetics.vat).to eq(8)
  end

  it 'product price' do
    expect(@vodka.price).to eq(@vodka.netto*(100 + @alcohol.vat)/100)
    expect(@beer.price).to eq(@beer.netto*(100 + @alcohol.vat)/100)
    expect(@eyeliner.price).to eq(@eyeliner.netto*(100 + @cosmetics.vat)/100)
  end
end

RSpec.describe Crud::Database  do
  before(:all) do
    # Inicjalizacja clientów
    @database = Crud::Database.new("system.sql")
    @database.insert_client(1, "Joanna", "Jabłońska")
    @database.insert_client(2, "Maciej", "Nowakowski")
    @database.insert_client(3, "Natalia", "Kazalska")
    # Inicjalizacja produktów
    @database.insert_product(1, "Heineken", 1, 5)
    @database.insert_product(2, "Vodka", 1, 15)
    @database.insert_product(3, "Bread", 2, 3)
    @database.insert_product(4, "Ham", 2, 5)
    @database.insert_product(5, "Lipstick", 3, 25)
    @database.insert_product(6, "Eyeliner", 3, 15)
    # Inicjalizacja kategorii
    @database.insert_category(1, "Alcohol", 64)
    @database.insert_category(2, "Food", 23)
    @database.insert_category(3, "Cosmetics", 8)
    # Uzupełnianie koszyków
    @database.insert_cart(1, 1, 2)
    @database.insert_cart(2, 1, 3)
    @database.insert_cart(3, 1, 4)
    @database.insert_cart(4, 1, 5)
    @database.insert_cart(5, 1, 6)
  end

  it 'read test 1' do
    expect(@database.read_client("Joanna", "Jabłońska")).to eq([[1, "Joanna", "Jabłońska"]])
  end
  it 'read test 2' do
    expect(@database.read_client("Maciej", "Nowakowski")).to eq([[2, "Maciej", "Nowakowski"]])
    expect(@database.read_product("Heineken")). to eq([[1, "Heineken", 1, 5]])
  end
  it 'read test 3' do
    expect(@database.read_client("Gal", "Anonim")).to eq([])
    expect(@database.read_category("Alcohol")).to eq([[1, "Alcohol", 64]])
  end

  it 'delete test 1' do
    @database.del_client("Joanna", "Jabłońska")
    expect(@database.read_client("Joanna", "Jabłońska")).to eq([])
  end

  it 'delete test 2' do
    @database.del_category("Alcohol")
    expect(@database.read_category("Alcohol")).to eq([])
  end

  it 'read cart' do
    expect(@database.read_cart(1)).to eq([["Vodka"], ["Bread"], ["Ham"], ["Lipstick"], ["Eyeliner"]])
  end

  it 'update test 1' do
    @database.insert_client(1, "Joanna", "Jabłońska")
    @database.update_client("Joanna", "Jabłońska", "Joanna", "Nycz")
    expect(@database.read_client("Joanna", "Nycz")).to eq([[1, "Joanna", "Nycz"]])
    expect(@database.read_client("Joanna", "Jabłońska")).to eq([])
  end

  it 'update test 2' do
    @database.insert_product(10, "Tea", 2, 10)
    @database.update_product("Tea", "Coffee", 2, 15)
    expect(@database.read_product("Coffee")).to eq([[10, "Coffee", 2, 15]])
  end

  it 'update test 3' do
    @database.insert_category(4, "Clothes", 22)
    @database.update_category("Clothes", "Clothes", 23)
    expect(@database.read_category("Clothes")).to eq([[4, "Clothes", 23]])
  end

  it 'cost test 1' do
    expect(@database.read_cost(1)).to eq(52)
  end

  it 'database deleting' do
    expect(@database.delete()).to eq("success")
    expect(@database.delete()).to eq("fail")
  end
end