require '/Users/oscarteeninga/Dropbox/Informatyka IET/Semestr 4/Ruby/Lab4/MiddleSin/aplikacja_sinatra'
require '/Users/oscarteeninga/Dropbox/Informatyka IET/Semestr 4/Ruby/Lab4/MiddleSin/middleware'
require 'yaml'

name = "Oscar"
surname = "Teeninga"

use Middleware, name, surname
run Protected