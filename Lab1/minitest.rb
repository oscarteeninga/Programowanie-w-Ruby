require 'minitest/autorun'
load 'firstscript.rb'

# Tests
class TestSum < MiniTest::Test
  def setup
    @result1 = sum(2, 2)
    @result2 = sum(2, 1.5)
    @result3 = sum(2, '2')
    @result4 = sum('2.1', '2.0')
  end
 
  def test_sum_integer_integer
    assert_equal(@result1, 4)
  end
 
  def test_sum_integer_float
    assert_equal(@result2, 3.5)
  end
 
  def test_sum_integer_string
    assert_equal(@result3, 4)
  end
 
  def test_sum_string_string
     assert_equal(@result4, 4.1)
  end
 
  def test_sum_integer_wrong_number_in_string
     #assert_equal(sum(2, 'Ala ma kota123'), 2)
     assert_raises(ArgumentError) { sum('Ala ma kota123', 2) }
  end

  def test_sum_rational_rational
    assert_equal(sum('1/3'.to_r, '2/3'.to_r), 1)
  end

  def test_sum_rational_integer
    assert_equal(sum('1/3'.to_r, 1), '4/3'.to_r)
  end

  def test_sum_rational_float
    assert_equal(sum('1/5'.to_r, 0.2), 0.4)
  end

  def test_sum_complex_complex
    assert_equal(sum(2+1i, '3-2i'), 5-1i)
  end

  def test_sum_array_warning
    assert_raises(ArgumentError) { sum([1,2], 2) }
  end
end
