require 'test_helper'

class MonthTest < ActiveSupport::TestCase
    test "add valid month" do
        @year = Year.create(year:2019)
        month = @year.months.create(nr:1, name:"Styczeń")
        assert month.valid?
    end

    test "add invalid month" do
        @year = Year.create(year:2019)
        month1 = @year.months.create(nr:13, name:"Niewiem")
        month2 = @year.months.create(nr:1, name:"XD")
        assert_not month1.valid?
        assert_not month2.valid?
        s_month1 = @year.months.find_by(nr:1)
        s_month2 = @year.months.find_by(name:"XD")
        assert_not s_month1
        assert_not s_month2
    end
end
