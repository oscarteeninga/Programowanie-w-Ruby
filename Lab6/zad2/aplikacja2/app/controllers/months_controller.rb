class MonthsController < ApplicationController
    @@year = 2019
    def index
        @year_valid = Year.new(year: @@year)
        if !@year_valid.valid?
            @@year = 2019
            return
        else 
            Month.delete_all
            Day.delete_all
            Year.delete_all
            
            @year = Year.create!(year: @@year)

            @months_name = ["Styczeń", "Luty", "Marzec", "Kwiecień", 
                            "Maj", "Czerwiec", "Lipiec", "Sierpień",
                            "Wrzesień", "Październik", "Listopad", "Grudzień"]
            
            i = 1
            while i < 13
                @month_valid = Month.new(nr: i, name: @months_name[i-1])
            
                month = @year.months.create(nr: i, name: @months_name[i-1])
                day = 1
                while Date.valid_date?(@year.year, i, day)
                    weekday = Date.new(@year.year, i, day).wday

                    newday = month.days.create!(nr:day, wday: weekday)
                    weekday += 1
                    if weekday > 6
                        weekday = 0
                    end
                    day += 1
                end
                i+=1
            end

            @h_month = Month.new
        end
    end

    def show
        @wdays = ["Ndz", "Pon", "Wto", "Śrd", "Czw", "Pt", "Sob"]
        @id = params[:id].to_i
        @year = @@year
        @month = Year.find_by(year:@year).months.find_by(nr:@id)
        @days = @month.days
        @first = @days.find_by(nr:1).wday
    end

    def edit
        @year = @@year
    end

    def update
        @@year = year_params
        redirect_to '/months'
    end

    def year_params
        params.require(:year).to_i
    end

    def self.year
        @@year
    end
end
