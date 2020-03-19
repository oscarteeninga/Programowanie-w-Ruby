ENV['RACK_ENV'] = 'test'

load 'aplikacja_sinatra.rb' # Aplikacja, która ma być testowana
# require 'rspec' # Odkomentuj tę linię, jeżeli do uruchamiania testów będziesz używał(a) komendy 'ruby', a nie 'rspec'
require 'rack/test'

describe 'The HelloWorld App' do
  include Rack::Test::Methods

  def app
    Sinatra::Application
  end

  it 'displays main page' do
    get '/'

    expect(last_response).to be_ok                   # Czy status odpowiedzi to 200?
    expect((last_response.body =~ /Hello World!/) > 0).to eq(TRUE) # Czy treścią zwróconego dokumentu HTML jest napis 'Hello World!'?
  end
end