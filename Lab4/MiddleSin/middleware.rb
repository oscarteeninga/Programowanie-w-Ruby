require 'yaml/store'
require '/Users/oscarteeninga/Dropbox/Informatyka IET/Semestr 4/Ruby/Lab4/MiddleSin/aplikacja_sinatra.rb'

class Middleware
    def initialize(app, name, surname)
      @app = app
      @name = name
      @surname = surname   
    end                
  
    def call(env)
        request = Rack::Request.new(env)
        _pass = [request.params["imie"], request.params["nazwisko"]]
        File.open("pass.yml", "w") { |pass| pass.write(_pass.to_yaml) }
        if request.params["imie"] == @name && request.params["nazwisko"] == @surname
            app = Rack::URLMap.new({
                "/" => Protected
            })
            app.call(env)
        else 
            app = Rack::URLMap.new({
            "/" => Public
            })
            app.call(env)
        end 
    end                
end   