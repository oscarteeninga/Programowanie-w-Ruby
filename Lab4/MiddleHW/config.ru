require '/Users/oscarteeninga/Dropbox/Informatyka IET/Semestr 4/Ruby/Lab4/MiddleHW/rack_app'
require '/Users/oscarteeninga/Dropbox/Informatyka IET/Semestr 4/Ruby/Lab4/MiddleHW/middleware'

use Middleware, "Oscar", "Teeninga"
run HelloWorld.new






