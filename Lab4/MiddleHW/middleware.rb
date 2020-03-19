class Middleware
    def initialize(app, name, surname)
      @app = app
      @name = name
      @surname = surname   
    end                
  
    def call(env)
        request = Rack::Request.new(env)
        if request.params == {}
            @app.call(env)
        elsif request.params["imie"] == @name && request.params["nazwisko"] == @surname
            @app.call(env)
        else 
            response = Rack::Response.new
            response.status = Rack::Utils::SYMBOL_TO_STATUS_CODE[:ok] # Ustaw kod statusu na 200. Zbędne, gdyż 200, to wartość domyślna własności 'status'; potrzebne do celów edukacyjnych ;-)
            response.header['Content-Type'] = 'text/html'             # Umieść, w nagłówku odpowiedzi, informację, że wysyłane dane będą HTML-em
            response.write %Q(<!DOCTYPE html>
        <html>
            <head>
                <meta charset="UTF-8">
                <title>Aplikacja Rack</title>
            </head>
            <body>)
            response.write("<h1>Aplikacja Rack</h1>")
            response.write("Dostęp wzbroniony")
            response.write %Q(
                <form action="http://localhost:9292/">
                    <input type="text" name="imie">
                    <input type="text" name="nazwisko">
                    <input type="submit" value="Send">
                </form>
            </body>
        </html>)            # Umieść, w ciele odpowiedzi, podany dokument HTML
            response.finish 
        end 
    end                
end   