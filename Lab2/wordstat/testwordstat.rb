require 'minitest/autorun'
load 'wordstat.rb'


# Tests
class BankTest < MiniTest::Test
  def setup
    @input1 = "A  labedz    oscar teeninga maciej krzys antek basia pomidor kaszanka"
    @input2 = ""
    @input3 = "djshfksjdnkfjabkjsbakdjbakjsbkbaksbdkajb"
  end
 
  def test_counting()
    array = count_words(@input1)
    assert_equal(array[1], 1)
    assert_equal(array[6], 2)
    assert_equal(array[5], 4)
    assert_equal(array[7], 1)
    assert_equal(array[8], 2)
  end

  def test_empty()
    array = count_words(@input2)
    assert_equal(array.size, 0)
    #array[0] istnieje, ze wzgledu na wygode impelementacji
  end
end