require 'sinatra'
require 'sinatra/reloader' if development?

class Public < Sinatra::Base
    get '/' do
        pass = YAML.load(File.read("pass.yml"))
        @welcome = "Dostęp wzbroniony"
        erb :public
    end
end

class Protected < Sinatra::Base
    get '/' do 
        pass = YAML.load(File.read("pass.yml"))
        @welcome = "Imie: " + pass[0].upcase + " Nazwisko: " + pass[1].upcase
        erb :protected
    end
end

