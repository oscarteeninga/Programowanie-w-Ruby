def add_client(clients, name)
    i = 0
    accounts = {}
    clients[name] = accounts
end

def add_on_account(clients, name, acc, value)
    begin
        value = Float(value)
        if clients[name] == nil
            add_client(clients, name)
            puts "Dodano klienta"
        end
        if clients[name][acc] == nil
            if value >= 0
                clients[name][acc] = value
                puts "Dodano konto i ustawiono stan"
            else
                puts "Nie mozna ustawic ujemnego bilansu na nowym koncie"
            end
            return
        end 
        if clients[name][acc]+value >= 0
            clients[name][acc] = value + clients[name][acc]
            puts "Zaktualizowano stan konta."
        else
            puts "Niewystarczający stan konta."
        end
    rescue
        puts "Nieprawidlowa kwota"
    end
end

def print_client(clients, name)
    if clients[name] != nil
        puts name
        for i in clients[name].keys
            puts "\tKonto #{i} \t #{clients[name][i]} zł"
        end
    else
        puts "Nie znaleziono klienta"
    end
end 

def print_clients(clients)
    for i in clients.keys
        print_client(clients, i)
    end
end

def interpret_command(clients, command)
    commandAr = command.split(":")
    if commandAr.empty? 
        puts "Nie podano komendy"
        return
    end
    if commandAr[0] == "--stan"
        if commandAr.length == 1
            print_clients(clients)
        else
            print_client(clients, commandAr[1])
        end
    else
        add_on_account(clients, commandAr[0], commandAr[1], commandAr[2])
    end
end

def program()
    clients = {}
    while (TRUE)
        command = gets.chomp
        interpret_command(clients, command)
    end
end
