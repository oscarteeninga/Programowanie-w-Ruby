require 'test_helper'

class YearTest < ActiveSupport::TestCase
    test "add valid year" do
        year = Year.create(year:2019)
        assert year.valid?
    end

    test "add invalid year" do
        year = Year.create(year:10)
        assert_not year.valid?
        s_year = Year.find_by(year:10)
        assert_not s_year
    end
end
