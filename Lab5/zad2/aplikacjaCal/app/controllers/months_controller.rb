class MonthsController < ApplicationController
    @@year = 2019
    
    def index
        @year = @@year
        @months = ["Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", 
                "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień" ]
    end

    def show
        @year = @@year
        @months = ["Styczeń", "Luty", "Marzec", "Kwiecień", "Maj", "Czerwiec", 
                "Lipiec", "Sierpień", "Wrzesień", "Październik", "Listopad", "Grudzień" ]
        @wdays = ["Pon", "Wto", "Śro", "Czw",
                "Pią", "Sob", "Nie"]
        while Date.valid_date?(@year, id+1, i)
            i += 1
        end

        @i = i
    end

    def edit
        @year = @@year
    end

    def update
        @@year = params[:year].to_i
        redirect_to '/months'
    end

    def self.year
        @@year
    end
end
