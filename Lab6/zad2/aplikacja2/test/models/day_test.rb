require 'test_helper'

class DayTest < ActiveSupport::TestCase

    test "add valid day" do
        @year = Year.create(year:2010)
        @month = @year.months.create(nr:1, name:"Styczeń")
        day = @month.days.create(nr:1, wday:1)
        assert day.valid?
    end

    test "add invalid day" do
        @year = Year.create(year:2010)
        @month = @year.months.create(nr:1, name:"Styczeń")
        day1 = @month.days.create(nr:1, wday:8)
        day2 = @month.days.create(nr:32, wday:5)
        day3 = @month.days.create(nr:33, wday:10)
        day4 = @month.days.create(nr:1, wday:"12")
        assert_not day1.valid?
        assert_not day2.valid?
        assert_not day3.valid?
        assert_not day4.valid?
        s_day1 = @month.days.find_by(nr:1)
        s_day2 = @month.days.find_by(wday:5)
        assert_not s_day1
        assert_not s_day2
    end
end
