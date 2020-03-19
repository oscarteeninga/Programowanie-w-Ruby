Welcome.find_by(id: 1)          # Wypisz treść komunikatu powitalnego (wartość pola 'message') zawartego w pierwszym rekordzie bazy danych, tu: "Hello World 1"
Welcome.last                    # Wypisz treść ostatniego komunikatu powitalnego
wlc = Welcome.find_by(id: 2)
wlc.message = "Hello World 4"
wlc.save                        # Zmodyfikuj, w bazie danych, treść komunikatu, którego 'id' to 2 - zastąp komunikat "Hello World 2" napisem "Hello World 4"
Welcome.first.destroy           # Usuń pierwszy komunikat
Welcome.create(id: 4, message: "Hello World 5") # Dopisz nowy komunikat (nowy rekord w bazie danych) o treści "Hello World 5"
@welcome = Welcome.all
@welcome[0]["message"]
@welcomes[@welcomes.size-1]["message"]


