# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Month.delete_all
Day.delete_all
Year.delete_all

year = Year.create!(year: MonthsController.year.to_i)
months_name = ["Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień"]

i = 1
while i < 13
    month = year.months.create(nr: i, name: months_name[i-1])
    day = 1
    while Date.valid_date?(year.year, i, day)
        weekday = Date.new(year.year, i, day).wday
        newday = month.days.create!(nr:day, wday: weekday)
        weekday += 1
        if weekday > 6
            weekday = 0
        end
        day += 1
    end
    i+=1
end



# Generating:
# bin/rails generate controller Months
# bin/rails generate model Year year:integer
# bin/rails generate model Month nr:integer name:string
# bin/rails generate model Day nr:integer wday:weekday
# bin/rails generate migration AddYearRefToMonths year:references
# bin/rails generate migration AddMonthRefToDays month:references