# Nazwa gema: 'SalesSystem'
 
RSpec.describe SalesSystem::Client do
    before(:all) do
      @client1 = SalesSystem::Client.new('Joanna', 'Kowalska')
      # Każdy produkt ma jednakową, stałą cenę
      @client1.add_product('Tusz')
      @client1.add_product('Tusz')
      @client1.add_product('Pomadka')
      @client1.add_product('Szampon')
      @client1.add_product('Szampon')
      @client1.add_product('Papierosy')
      ######################
      # Każdy produkt ma jednakową, stałą cenę
      @client2 = SalesSystem::Client.new('Jerzy', 'Nowak')
      @client2.add_product('Piwo')
      @client2.add_product('Szampon')
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
      expect { puts @client1 }.to output("Joanna Kowalska\n\nRabat=10%\n\nTusz\nTusz\nPomadka\nSzampon\nSzampon\nPapierosy\n\nSuma=54\n").to_stdout
      expect { puts @client2 }.to output("Jerzy Nowak\n\nRabat=0%\n\nPiwo\nSzampon\n\nSuma=20\n").to_stdout
    end
   
    it 'can modify personal data' do
      @client1.first_name = 'Joanna Urszula'
      @client1.last_name = 'Nowak'
      expect(@client1.first_name).to eq 'Joanna Urszula'
      expect(@client1.last_name).to eq 'Nowak'
    end
   
    it 'properly stores products' do
      expect(@client1.products).to match_array(%w[Tusz Tusz Pomadka Szampon Szampon Papierosy])
      expect(@client2.products).to match_array(%w[Piwo Szampon])
    end
   
    it 'has a discount when he bought, at least, 5 products' do
      expect(@client1.has_discount?).to be_truthy
      expect(@client1.has_discount?).to be_falsy
    end
  end
   
  RSpec.describe SalesSystem::Grocery do
    before(:each) do
      @grocery = SalesSystem::Grocery.new
      @client1 = SalesSystem::Client.new('Joanna', 'Kowalska')
      @client2 = SalesSystem::Client.new('Jerzy', 'Nowak')
    end
    it 'is empty at the beginning' do
      expect(@grocery.length).to eq(0)
    end
    it 'properly adds clients' do
      @grocery << @client1
      @grocery << @client2
      expect(@grocery.length).to eq(2)
    end
    it 'properly implements the "[]" method' do
      key1 = (@client1.first_name + ' ' + @client1.last_name).to_sym
      key2 = (@client2.first_name + ' ' + @client2.last_name).to_sym
      expect(@grocery[key1].last_name).to eq(@client1.last_name)
      expect(@grocery[key2].first_name).to eq(@client2.first_name)
    end
    it 'can display full information' do
      expect { p @grocery }.to output(%(["Jan Kowalski"], ["Jerzy Nowak"]\n)).to_stdout
    end
  end