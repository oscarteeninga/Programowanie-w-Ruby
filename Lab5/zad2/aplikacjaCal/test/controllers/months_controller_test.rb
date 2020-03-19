require 'test_helper'
require 'date'

class MonthsControllerTest < ActionDispatch::IntegrationTest
    test "A - test rendered index" do
        get months_url
        assert_select "li", 12
    end

    test "B - test render id" do
        get '/months/1'
        assert_response :success 
    end

    test "C - test calendar april" do
        #dla kwietnia
        if MonthsController.year == 2019
            get '/months/3'
            assert_select 'table', 1
            assert_select 'tr', 6
            date = Date.new(2019, 4, 1)
            wdayone = date.wday
            assert_select "td", 30+7+(wdayone+7) % 8
            assert_equal MonthsController.year, 2019
        end
    end

    test "D - test calendar december" do
        #dla grudnia
        if MonthsController.year == 2019
            get '/months/11'
            assert_select 'table', 1
            assert_select 'tr', 7
            date = Date.new(2019, 12, 1)
            wdayone = date.wday
            assert_select "td", 31+7+wdayone+6
            assert_equal MonthsController.year, 2019
        end
    end

    test "E - test year edit" do
        get '/months/year/edit'
        assert_select 'form', 1
        assert_select 'input', 4
        put '/months/year', params: {"utf8"=>"✓",
        "authenticity_token"=>"STvMtY0X4TV4dTAXSZPfJPUgaHhEMqkcB0ZNptxMRNeUz9RZOmyVEAEYImcuyNyP2/EGGok+ln9UuVcchIa3zA==", 
        "year"=>"2000", "commit"=>"Save", "id"=>"year"}
        assert_equal MonthsController.year, 2000
    end
end
